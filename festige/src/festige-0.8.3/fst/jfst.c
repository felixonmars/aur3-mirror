/*
    Copyright (C) 2004 Paul Davis <paul@linuxaudiosystems.com> 
                       Torben Hohn <torbenh@informatik.uni-bremen.de>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

#include <sys/types.h>
#include <string.h>
#include <stdio.h>
#include <fst.h>
#include <glib.h>
#include <semaphore.h>
#include <vestige/aeffectx.h>

#include "jackvst.h"
#include "jack/midiport.h"

#include <windows.h>

/* audiomaster.c */

extern long jack_host_callback (struct AEffect*, long, long, long, void*, float);

/* gtk.c */

extern void gui_init (int* argc, char** argv[]);
extern int  manage_vst_plugin (JackVST*);

/* Ladish support */
extern int ladish_save_now;
extern char* ladish_state_filename;

/* Prototype for plugin "canDo" helper function*/
int canDo(struct AEffect* plugin, char* feature);

/* Structures & Prototypes for midi output and associated queue */
typedef struct _MidiMessage MidiMessage;

struct _MidiMessage {
	jack_nframes_t	time;
	int				len;	/* Length of MIDI message, in bytes. */
	unsigned char	data[3];
};
#define RINGBUFFER_SIZE	1024*sizeof(MidiMessage)
void process_midi_output(JackVST* jvst, jack_nframes_t nframes);
void queue_midi_message(JackVST* jvst, int status, int d1, int d2, jack_nframes_t delta);


// Until i get Jack to call me when he wants to create a thread,
// i need to go through this.

volatile int with_winaudio = 1;

static HANDLE audioThreadHandle = 0;
static jack_nframes_t winaudio_nframes;
static void *winaudio_data;
sem_t winaudio_activate, winaudio_done;

static pthread_t audio_thread = 0;

int winaudio_process_callback( jack_nframes_t nframes, void *data ) 
{
    winaudio_nframes = nframes;
    winaudio_data = data;

    sem_post( &winaudio_activate );
    sem_wait( &winaudio_done );

    return 0;
}

DWORD WINAPI
WinAudioThreadMain(LPVOID parameter) 
{

    struct sched_param param;
    param.sched_priority = 10;
    pthread_setschedparam(pthread_self(), SCHED_FIFO, &param);

    sem_post( &winaudio_done );

    while( with_winaudio ) {
	sem_wait( &winaudio_activate );
	process_callback( winaudio_nframes, winaudio_data );
	sem_post( &winaudio_done );
    }
    return 0;
}

void process_midi_output(JackVST* jvst, jack_nframes_t nframes)
{
	/* This jack ringbuffer consume code was largely taken from jack-keyboard */
	/* written by Edward Tomasz Napierala <trasz@FreeBSD.org>                 */
	int		read, t;
	unsigned char  *buffer;
	void           *port_buffer;
	jack_nframes_t	last_frame_time;
	jack_ringbuffer_t* ringbuffer;
	MidiMessage ev;

	last_frame_time = jack_last_frame_time(jvst->client);

	port_buffer = jack_port_get_buffer(jvst->midi_outport, nframes);
	if (port_buffer == NULL) {
		fst_error("jack_port_get_buffer failed, cannot send anything.");
		return;
	}

	ringbuffer = jvst->ringbuffer;
	while (jack_ringbuffer_read_space(ringbuffer)) {
		read = jack_ringbuffer_peek(ringbuffer, (char*)&ev, sizeof(ev));
		if (read != sizeof(ev)) {
			fst_error("Short read from the ringbuffer, possible note loss.");
			jack_ringbuffer_read_advance(ringbuffer, read);
			continue;
		}

		t = ev.time + nframes - last_frame_time;

		/* If computed time is too much into the future, we'll send it later. */
		if (t >= (int)nframes) break;

		/* If computed time is < 0, we missed a cycle because of xrun. */
		if (t < 0) t = 0;

		jack_ringbuffer_read_advance(ringbuffer, sizeof(ev));

		buffer = jack_midi_event_reserve(port_buffer, t, ev.len);
		if (buffer == NULL) {
			fst_error("queue: jack_midi_event_reserve failed, NOTE LOST.");
			break;
		}

		memcpy(buffer, ev.data, ev.len);
	}
}

void queue_midi_message(JackVST* jvst, int status, int d1, int d2, jack_nframes_t delta )
{
	jack_ringbuffer_t* ringbuffer;
	int	written;
	int	statusHi = (status >> 4) & 0xF;
	int	statusLo = status & 0xF;
	MidiMessage ev;

	/*fst_error("queue_new_message = 0x%hhX, %d, %d\n", status, d1, d2);*/
	/* fst_error("statusHi = %d, statusLo = %d\n", statusHi, statusLo);*/

	ev.data[0] = status;
	if (statusHi == 0xC || statusHi == 0xD) {
		ev.len = 2;
		ev.data[1] = d1;
	} else if (statusHi == 0xF) {
		if (statusLo == 0 || statusLo == 2) {
			ev.len = 3;
			ev.data[1] = d1;
			ev.data[2] = d2;
		} else if (statusLo == 1 || statusLo == 3) {
			ev.len = 2;
			ev.data[1] = d1;
		} else ev.len = 1;
	} else {
		ev.len = 3;
		ev.data[1] = d1;
		ev.data[2] = d2;
	}

	if( pthread_self() == audio_thread ) {
		unsigned char  *buffer;
		void           *port_buffer;
		port_buffer = jack_port_get_buffer(jvst->midi_outport, jack_get_buffer_size( jvst->client ) );
		if (port_buffer == NULL) {
			fst_error("jack_port_get_buffer failed, cannot send anything.");
			return;
		}

		buffer = jack_midi_event_reserve(port_buffer, delta, ev.len);
		if (buffer == NULL) {
			fst_error("jack_midi_event_reserve failed, NOTE LOST.");
			return;
		}
		memcpy(buffer, ev.data, ev.len);

		return;
	}

	ev.time = jack_frame_time(jvst->client) + delta;

	ringbuffer = jvst->ringbuffer;
	if (jack_ringbuffer_write_space(ringbuffer) < sizeof(ev)) {
		fst_error("Not enough space in the ringbuffer, NOTE LOST.");
		return;
	}

	written = jack_ringbuffer_write(ringbuffer, (char*)&ev, sizeof(ev));
	if (written != sizeof(ev)) {
		fst_error("jack_ringbuffer_write failed, NOTE LOST.");
	}
}

int process_callback( jack_nframes_t nframes, void* data) 
{
	int i, o;
	int current_program;
	JackVST* jvst = (JackVST*) data;
	struct AEffect* plugin = jvst->fst->plugin;

	audio_thread = pthread_self();

	if( !jvst->resume_called ) {
	    jvst->resume_called = TRUE;
	    plugin->dispatcher (plugin, effMainsChanged, 0, 1, NULL, 0.0f);
	}
	for (i = 0; i < plugin->numInputs; ++i) {
		jvst->ins[i]  = (float *) jack_port_get_buffer (jvst->inports[i], nframes);
	}

	for (i = 0; i < plugin->numOutputs; ++i) {
		jvst->outs[i]  = (float *) jack_port_get_buffer (jvst->outports[i], nframes);
	}

	if (jvst->bypassed) {

		if (plugin->numInputs) {
			for (o = 0, i = 0; o < plugin->numOutputs; ++o) {
				memcpy (jvst->outs[o], jvst->ins[i], sizeof (float) * nframes);
				
				if (i < plugin->numOutputs - 1) {
					++i;
				}
			}
		} else {
			for (o = 0, i = 0; o < plugin->numOutputs; ++o) {
				if (jvst->outs[o]) {
					memset (jvst->outs[o], 0, sizeof (float) * nframes);
				}
			}
		}
		
	} else if (jvst->muted) {

		for (o = 0, i = 0; o < plugin->numOutputs; ++o) {
			if (jvst->outs[o]) {
				memset (jvst->outs[o], 0, sizeof (float) * nframes);
			}
		}
		
	} else {

		if (jvst->midi_outport) {
			void *port_buffer = jack_port_get_buffer(jvst->midi_outport, nframes);
			if (port_buffer == NULL) {
				fst_error("jack_port_get_buffer failed, cannot send anything.");
				return;
			}
			jack_midi_clear_buffer(port_buffer);
		}

		if (jvst->midi_inport) {
			void *port_buffer = jack_port_get_buffer( jvst->midi_inport, nframes );
			jack_nframes_t num_jackevents = jack_midi_get_event_count( port_buffer );
			jack_midi_event_t jackevent;
			int j,stuffed_events = 0;

			if( num_jackevents >= MIDI_EVENT_MAX )
				num_jackevents = MIDI_EVENT_MAX;

			for( i=0; i<num_jackevents; i++ ) {
				if( jack_midi_event_get( &jackevent, port_buffer, i ) != 0 )
					break;

				if( (jackevent.buffer[0] & 0xf0) == 0xb0 && jvst->midi_learn ) {
					jvst->midi_learn_CC = jackevent.buffer[1];
				} else if( (jackevent.buffer[0] & 0xf0) == 0xb0 && jvst->midi_map[jackevent.buffer[1]] != -1 ) {
					// midi mapped.
					int parameter = jvst->midi_map[jackevent.buffer[1]];
					float value = 1.0/127.0 * (float) jackevent.buffer[2];
					plugin->setParameter( plugin, parameter, value );

				} else if( jvst->want_midi_in ) {
					jvst->event_array[stuffed_events].type = kVstMidiType;
					jvst->event_array[stuffed_events].byteSize = 24;
					jvst->event_array[stuffed_events].deltaFrames = jackevent.time;

					for( j=0; (j<4); j++ ) {
						jvst->event_array[stuffed_events].midiData[j] = 
							(j<jackevent.size) ? jackevent.buffer[j] : 0;
					}
					stuffed_events += 1;
				}
			}

			if( stuffed_events > 0 ) {
				jvst->events->numEvents = stuffed_events;
				plugin->dispatcher (plugin, effProcessEvents, 0, 0, jvst->events, 0.0f);
			}
		}

		current_program = plugin->dispatcher( plugin, effGetProgram, 0, 0, NULL, 0.0f );
		if( current_program >= 0 )
			jvst->current_program = current_program;

		if (plugin->flags & effFlagsCanReplacing) {
			
			for (i = 0; i < plugin->numOutputs; ++i) {
				memset (jvst->outs[i], 0, sizeof (float) * nframes);
			}
			plugin->processReplacing (plugin, jvst->ins, jvst->outs, nframes);
			
		} else {
			
			for (i = 0; i < plugin->numOutputs; ++i) {
				memset (jvst->outs[i], 0, sizeof (float) * nframes);
			}
			plugin->process (plugin, jvst->ins, jvst->outs, nframes);
		}
		if (jvst->midi_outport) {
			process_midi_output(jvst, nframes);
		}
	}
	
	if (ladish_save_now)
	{
	  printf("got ladish save here\n");
	  fst_save_state (jvst->fst, ladish_state_filename);
	  ladish_save_now = 0;
	}

	return 0;      
}

enum ParseMode {
    MODE_NORMAL,
    MODE_QUOTE,
    MODE_DOUBLEQUOTE,
    MODE_ESCAPED,
    MODE_WHITESPACE,
    MODE_EOL

};
void create_argc_argv_from_cmdline( char *cmdline, char *argv0, int *argc, char ***argv ) {
    // first count argc
    char *pos = cmdline;
    enum ParseMode parseMode = MODE_WHITESPACE;
    enum ParseMode parseMode_before_ESC = MODE_NORMAL;
    int i;

    int myargc = 1; 
    char **myargv;

    while( parseMode != MODE_EOL ) {
	switch( parseMode ) {
	    case MODE_NORMAL:
		switch( *pos ) {
		    case '\"':
			parseMode = MODE_DOUBLEQUOTE;
			break;
		    case '\'':
			parseMode = MODE_QUOTE;
			break;
		    case '\\':
			parseMode_before_ESC = parseMode;
			parseMode = MODE_ESCAPED;
			break;
		    case ' ':	// First Space after an arg;
			parseMode = MODE_WHITESPACE;
			myargc++;
			break;
		    case 0:	// EOL after arg.
			parseMode = MODE_EOL;
			break;
		    default:
			// Normal char;
			break;
		}
		break;
	    case MODE_QUOTE:
		switch( *pos ) {
		    case '\'':
			parseMode = MODE_NORMAL;
			break;
		    case '\\':
			parseMode_before_ESC = parseMode;
			parseMode = MODE_ESCAPED;
			break;
		    case 0:
			fst_error( "parse Error on cmdline" );
			parseMode = MODE_EOL;
			break;
		    default:
			// Normal char;
			break;
		}
		break;
	    case MODE_DOUBLEQUOTE:
		switch( *pos ) {
		    case '\"':
			parseMode = MODE_NORMAL;
			break;
		    case '\\':
			parseMode_before_ESC = parseMode;
			parseMode = MODE_ESCAPED;
			break;
		    case 0:
			fst_error( "parse Error on cmdline" );
			parseMode = MODE_EOL;
			break;
		    default:
			// Normal char;
			break;
		}
		break;
	    case MODE_ESCAPED:
		switch( *pos ) {
		    case '\"':
			// emit escaped char;
			parseMode = parseMode_before_ESC;
			break;
		    case '\'':
			// emit escaped char;
			parseMode = parseMode_before_ESC;
			break;
		    case '\\':
			// emit escaped char;
			parseMode = parseMode_before_ESC;
			break;
		    case 0:
			fst_error( "EOL after escape: ignored" );
			parseMode = MODE_EOL;
			break;
		    default:
			fst_error( "Unknown Escapecharacter: ignored" );
			parseMode = parseMode_before_ESC;
			// Normal char;
			break;
		}
		break;
	    case MODE_WHITESPACE:
		switch( *pos ) {
		    case '\"':
			parseMode = MODE_DOUBLEQUOTE;
			myargc++;
			break;
		    case '\'':
			parseMode = MODE_QUOTE;
			myargc++;
			break;
		    case '\\':
			parseMode_before_ESC = MODE_NORMAL;
			parseMode = MODE_ESCAPED;
			myargc++;
			break;
		    case ' ':
			parseMode = MODE_WHITESPACE;
			break;
		    case 0:
			parseMode = MODE_EOL;
			break;
		    default:
			// 
			parseMode = MODE_NORMAL;
			// Normal char;
			myargc++;
			break;
		}
		break;
	}
	pos++;
    }

    myargv = malloc( myargc * sizeof( char * ) );
    if( !myargv ) {
	fst_error( "cant alloc memory" );
	exit( 10 );
    }

    // alloc strlen(cmdline) + 1 for each argv.
    // this avoids another parsing pass.
    for( i=0; i<myargc; i++ ) {
	myargv[i] = malloc( strlen(cmdline) + 1 );
	if( !myargv[i] ) {
	    fst_error( "cant alloc memory" );
	    exit( 10 );
	}
	myargv[i][0] = 0;
    }

    // Now rerun theparser and actually emit chars.
    pos = cmdline;
    parseMode = MODE_WHITESPACE;
    parseMode_before_ESC = MODE_NORMAL;
    int current_arg = 0;
    char *emit_pos = myargv[0];
    
    while( parseMode != MODE_EOL ) {
	switch( parseMode ) {
	    case MODE_NORMAL:
		switch( *pos ) {
		    case '\"':
			parseMode = MODE_DOUBLEQUOTE;
			break;
		    case '\'':
			parseMode = MODE_QUOTE;
			break;
		    case '\\':
			parseMode_before_ESC = parseMode;
			parseMode = MODE_ESCAPED;
			break;
		    case ' ':	// First Space after an arg;
			parseMode = MODE_WHITESPACE;
			*emit_pos = 0;

			break;
		    case 0:	// EOL after arg.
			parseMode = MODE_EOL;
		        *emit_pos = 0;	
			break;
		    default:

			*(emit_pos++) = *pos;
			break;
		}
		break;
	    case MODE_QUOTE:
		switch( *pos ) {
		    case '\'':
			parseMode = MODE_NORMAL;
			break;
		    case '\\':
			parseMode_before_ESC = parseMode;
			parseMode = MODE_ESCAPED;
			break;
		    case 0:
			fst_error( "parse Error on cmdline" );
			parseMode = MODE_EOL;
		        *emit_pos = 0;	
			break;
		    default:
			// Normal char;
			*(emit_pos++) = *pos;
			break;
		}
		break;
	    case MODE_DOUBLEQUOTE:
		switch( *pos ) {
		    case '"':
			parseMode = MODE_NORMAL;
			break;
		    case '\\':
			parseMode_before_ESC = parseMode;
			parseMode = MODE_ESCAPED;
			break;
		    case 0:
			fst_error( "parse Error on cmdline" );
			parseMode = MODE_EOL;
		        *emit_pos = 0;	
			break;
		    default:
			// Normal char;
			*(emit_pos++) = *pos;
			break;
		}
		break;
	    case MODE_ESCAPED:
		switch( *pos ) {
		    case '\"':
			// emit escaped char;
			parseMode = parseMode_before_ESC;
			*(emit_pos++) = *pos;
			break;
		    case '\'':
			// emit escaped char;
			parseMode = parseMode_before_ESC;
			*(emit_pos++) = *pos;
			break;
		    case '\\':
			// emit escaped char;
			parseMode = parseMode_before_ESC;
			*(emit_pos++) = *pos;
			break;
		    case 0:
			fst_error( "EOL after escape: ignored" );
			parseMode = MODE_EOL;
		        *emit_pos = 0;	
			break;
		    default:
			fst_error( "Unknown Escapecharacter: ignored" );
			parseMode = parseMode_before_ESC;
			break;
		}
		break;
	    case MODE_WHITESPACE:
		switch( *pos ) {
		    case '\"':
			parseMode = MODE_DOUBLEQUOTE;
			// ok... arg begins
			current_arg++;
			emit_pos = myargv[current_arg];
			break;
		    case '\'':
			parseMode = MODE_QUOTE;
			// ok... arg begins
			current_arg++;
			emit_pos = myargv[current_arg];
			break;
		    case '\\':
			parseMode_before_ESC = MODE_NORMAL;
			parseMode = MODE_ESCAPED;
			// ok... arg begins
			current_arg++;
			emit_pos = myargv[current_arg];
			break;
		    case ' ':
			parseMode = MODE_WHITESPACE;
			break;
		    case 0:
			parseMode = MODE_EOL;
			break;
		    default:
			parseMode = MODE_NORMAL;
			// ok... arg begins
			current_arg++;
			emit_pos = myargv[current_arg];
			// Normal char;
			*(emit_pos++) = *pos;
			break;
		}
		break;
	}
	pos++;
    }

    strncpy( myargv[0], argv0, strlen(cmdline) );
    
    *argc = myargc;
    *argv = myargv;
}

/* Plugin "canDo" helper function to neaten up plugin feature detection calls */
int canDo(struct AEffect* plugin, char* feature)
{
	return (plugin->dispatcher(plugin, effCanDo, 0, 0, (void*)feature, 0.0f) > 0);
}

//Ladish SIGUSR1
static void sig_ladish(int sig)
{
    printf("got SIGUSR1, saving state now...\n");
    ladish_save_now = 1;
}

int WINAPI
WinMain(HINSTANCE hInst, HINSTANCE hPrevInst, LPSTR cmdline, int cmdshow)
//int 
//main( int argc, char **argv ) 
{
	JackVST* jvst;
	struct AEffect* plugin;
	int i;
	char* client_name = 0;
	char* period;
	int with_editor = 1;
	int resume_not_rt = 1;
	int load_state = 0;
	char * state_file = 0;
	char *plug;
	int vst_version;

	float sample_rate = 0;
	long  block_size = 0;

	int argc;
	char **argv;

        //Ladish SIGUSR1
        struct sigaction sa;
        memset(&sa, 0, sizeof(sa));
        sa.sa_handler = sig_ladish;
        sigaction(SIGUSR1, &sa, NULL);
        ladish_save_now = 0;

	create_argc_argv_from_cmdline( cmdline, "./fst", &argc, &argv );

	if (argc < 3) {
		fprintf (stderr, "usage: %s <ladish-state-filename> <plugin>\n", argv[0]);
		return 1;
	}

	printf( "yo... lets see...\n" );
	//setpgrp();

	gui_init (&argc, &argv);
	
	ladish_state_filename = argv[1];
	
	if (open(ladish_state_filename, O_RDONLY) > 0) {
	  load_state = 1;
	  state_file = ladish_state_filename;
	}

	plug = argv[2];

	if (fst_init (hInst)) {
		return 1;
	}

	jvst = (JackVST*) calloc (1, sizeof (JackVST));
	for (i=0; i<128; i++ )
		jvst->midi_map[i] = -1;

	client_name = g_path_get_basename(strdup (plug));
	if ((period = strrchr (client_name, '.')) != NULL) {
		*period = '\0';
	}

	if ((jvst->handle = fst_load (plug)) == NULL) {
		fst_error ("can't load plugin %s", plug);
		return 1;
	}
	if ((jvst->client = jack_client_open (client_name, JackNullOption, NULL )) == 0) {
		fst_error ("can't connect to JACK");
		return 1;
	}

	printf( "instantiate... \n" );

	if ((jvst->fst = fst_instantiate (jvst->handle, jack_host_callback, jvst)) == NULL) {
		fst_error ("can't instantiate plugin %s", plug);
		return 1;
	}

	plugin = jvst->fst->plugin;

	/* set rate and blocksize */
	sample_rate = (float)jack_get_sample_rate(jvst->client);
	block_size = jack_get_buffer_size(jvst->client);

	printf("Sample Rate = %.2f\n", sample_rate);
	printf("Block Size = %ld\n", block_size);

	plugin->dispatcher (plugin, effSetSampleRate, 0, 0, NULL, 
			    (float) jack_get_sample_rate (jvst->client));
	plugin->dispatcher (plugin, effSetBlockSize, 0, 
			    jack_get_buffer_size (jvst->client), NULL, 0.0f);


	/* set program to zero */
	/* i comment this out because it breaks dfx Geometer
	 * looks like we cant set programs for it
	 *
	 * TODO:
	 * this might have been because we were not a real wine thread, but i doubt
	 * it. need to check.
	 *
	 * plugin->dispatcher (plugin, effSetProgram, 0, 0, NULL, 0.0f); 
	 */


	jvst->midi_inport = jack_port_register(jvst->client,
										   "midi-in",
										   JACK_DEFAULT_MIDI_TYPE,
										   JackPortIsInput,
										   0);

	vst_version = plugin->dispatcher (plugin, effGetVstVersion, 0, 0, NULL, 0.0f);
	if (vst_version >= 2) {
		int isSynth = (plugin->flags & effFlagsIsSynth) > 0;
		int canReceiveVstEvents = canDo(plugin, "receiveVstEvents");
		int canReceiveVstMidiEvent = canDo(plugin, "receiveVstMidiEvent");
		int canSendVstEvents = canDo(plugin, "sendVstEvents");
		int canSendVstMidiEvent = canDo(plugin, "sendVstMidiEvent");

		printf("Plugin isSynth = %d\n", isSynth);
		printf("Plugin canDo receiveVstEvents = %d\n", canReceiveVstEvents);
		printf("Plugin canDo receiveVstMidiEvent = %d\n", canReceiveVstMidiEvent);
		printf("Plugin canDo sendVstEvents = %d\n", canSendVstEvents);
		printf("Plugin canDo SendVstMidiEvent = %d\n", canSendVstMidiEvent);

		/* should we send the plugin VST events (i.e. MIDI) */
		if (isSynth || canReceiveVstEvents || canReceiveVstMidiEvent) {
			int i;
			jvst->want_midi_in = 1;

			/* The VstEvents structure already contains an array of 2    */
			/* pointers to VstEvent so I guess that this malloc actually */
			/* gives enough  space for MIDI_EVENT_MAX + 2 events....     */
			jvst->events = (VstEvents*)malloc(sizeof(VstEvents) +
					(MIDI_EVENT_MAX * sizeof(VstMidiEvent*)));

			jvst->events->numEvents = 0;
			jvst->events->reserved = 0;

			/* Initialise dynamic array of MIDI_EVENT_MAX VstMidiEvents */
			/* and point the VstEvents events array of pointers to it   */
			jvst->event_array = (VstMidiEvent*)calloc(MIDI_EVENT_MAX,
													  sizeof (VstMidiEvent));
			for (i = 0; i < MIDI_EVENT_MAX; i++) {
				jvst->events->events[i] = (VstEvent*)&(jvst->event_array[i]);
			}
		}

		/* Can the plugin send VST events (i.e. MIDI) */
		if (canSendVstEvents || canSendVstMidiEvent) {
			jvst->ringbuffer = jack_ringbuffer_create(RINGBUFFER_SIZE);
			if (jvst->ringbuffer == NULL) {
				fst_error("Cannot create JACK ringbuffer.");
				return 1;
			}

			jack_ringbuffer_mlock(jvst->ringbuffer);

			jvst->midi_outport = jack_port_register(jvst->client,
													"midi-out",
													JACK_DEFAULT_MIDI_TYPE,
													JackPortIsOutput,
													0);
		}
	}

	printf("PortLayout: in: %d out: %d\n", plugin->numInputs, plugin->numOutputs);

	jvst->inports = (jack_port_t**)malloc(sizeof(jack_port_t*) * plugin->numInputs);
	jvst->ins = (float**)malloc(sizeof(float*) * plugin->numInputs);
	
	for (i = 0; i < plugin->numInputs; ++i) {
		char buf[64];
		snprintf (buf, sizeof(buf), "in%d", i+1);
		jvst->inports[i] = jack_port_register (jvst->client, buf, JACK_DEFAULT_AUDIO_TYPE, JackPortIsInput, 0);
	}
	
	jvst->outports = (jack_port_t **) malloc (sizeof(jack_port_t*) * plugin->numOutputs);
	jvst->outs = (float **) malloc (sizeof (float *) * plugin->numOutputs);
	
	for (i = 0; i < plugin->numOutputs; ++i) {
		char buf[64];
		snprintf (buf, sizeof(buf), "out%d", i+1);
		jvst->outports[i] = jack_port_register (jvst->client, buf, JACK_DEFAULT_AUDIO_TYPE, JackPortIsOutput, 0);
	}

	if( with_winaudio ) {
	    DWORD threadId = 0;

	    sem_init( &winaudio_activate, 0, 0 );
	    sem_init( &winaudio_done, 0, 0 );
	    
	    audioThreadHandle = CreateThread(0, 0, WinAudioThreadMain, 0, 0, &threadId);
	    if (!audioThreadHandle) {
		fst_error( "Failed to create audio thread!" );
		return 1;
	    }
	    // ok... this waits for the windows thread to get up in the first place.
	    sem_wait( &winaudio_done );
	    printf( "created audio thread\n" );
	    jack_set_process_callback (jvst->client, (JackProcessCallback) winaudio_process_callback, jvst); 
	} else {
	
	    jack_set_process_callback (jvst->client, (JackProcessCallback) process_callback, jvst); 
	}
	printf( "Calling Jack activate\n" );
	jack_activate (jvst->client);

	if (with_editor) {
		printf( "open Editor\n" );

		if (fst_run_editor (jvst->fst)) {
			fst_error ("cannot create editor");
			return 1;
		}
	} else {
		printf( "no Editor\n" );
	}

        /* load state if requested */

	if (load_state) {
		if (!fst_load_state (jvst->fst, state_file)) {
			printf ("ERROR: Could not load state file %s\n", state_file);
			jack_deactivate( jvst->client );
			if( with_winaudio ) {
				printf( "Waiting for WinAudioThread to exit\n" );
				with_winaudio = 0;
				CloseHandle( audioThreadHandle );
			}
			return 1;
		}
	}
	

	printf( "Entering main loop\n" );
	if (with_editor) {
		printf( "ok.... RockNRoll\n" );
		manage_vst_plugin (jvst);
	} else {
	    while( 1 )
		sleep (10);
	}
	
	jack_deactivate( jvst->client );
	if( with_winaudio ) {
	    printf( "Waiting for WinAudioThread to exit\n" );
	    with_winaudio = 0;
	    CloseHandle( audioThreadHandle );
	}
	return 0;
}

