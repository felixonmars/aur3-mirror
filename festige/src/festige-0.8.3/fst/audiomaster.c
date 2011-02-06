/*
    Copyright (C) 2002 Kjetil S. Matheussen / Notam.

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

#include <stdbool.h>
#include <stdio.h>

#include "jackvst.h"
#include <vestige/aeffectx.h>
#include <math.h>

/* The following audioMaster opcode handlings are copied
 * (with a light modification) from the vst tilde source
 * made by Mark Williamson.
*/

//#define DEBUG_CALLBACKS

#ifdef DEBUG_CALLBACKS
#define SHOW_CALLBACK fst_error
#else
#define SHOW_CALLBACK(...)
#endif

extern void queue_midi_message(JackVST* jvst, int status, int d1, int d2, jack_nframes_t delta );

long jack_host_callback (struct AEffect* effect,
			 long opcode,
			 long index,
			 long value,
			 void* ptr,
			 float opt)
{
	static struct VstTimeInfo _timeInfo;
	JackVST* jackvst = effect ? ((JackVST*) effect->user) : NULL;
	jack_position_t jack_pos;
	jack_transport_state_t tstate;

	//SHOW_CALLBACK ("am callback, opcode = %d", opcode);
	
	switch(opcode){

	case audioMasterAutomate:
		SHOW_CALLBACK ("amc: audioMasterAutomate\n");
		// index, value, returns 0
		//effect->setParameter (effect, index, opt);
		if( jackvst && jackvst->midi_learn ) {
			jackvst->midi_learn_PARAM = index;
		}
		return 0;

	case audioMasterVersion:
		SHOW_CALLBACK ("amc: audioMasterVersion\n");
		// vst version, currently 2 (0 for older)
		return 2;

	case audioMasterCurrentId:	
		SHOW_CALLBACK ("amc: audioMasterCurrentId\n");
		// returns the unique id of a plug that's currently
		// loading
		return 0;
		
	case audioMasterIdle:
		SHOW_CALLBACK ("amc: audioMasterIdle\n");
		// call application idle routine (this will
		// call effEditIdle for all open editors too) 
		effect->dispatcher(effect, effEditIdle, 0, 0, NULL, 0.0f);
		return 0;

	case audioMasterPinConnected:		
		SHOW_CALLBACK ("amc: audioMasterPinConnected\n");
		// inquire if an input or output is beeing connected;
		// index enumerates input or output counting from zero:
		// value is 0 for input and != 0 otherwise. note: the
		// return value is 0 for <true> such that older versions
		// will always return true.
		return 0;

	case audioMasterWantMidi:
		SHOW_CALLBACK ("amc: audioMasterWantMidi\n");
		// <value> is a filter which is currently ignored
		return 0;

	case audioMasterGetTime:
		//SHOW_CALLBACK ("amc: audioMasterGetTime\n");
		// returns const VstTimeInfo* (or 0 if not supported)
		// <value> should contain a mask indicating which fields are required
		// (see valid masks above), as some items may require extensive
		// conversions

		//return 0;

		memset(&_timeInfo, 0, sizeof(_timeInfo));
		if (jackvst) {
			tstate = jack_transport_query (jackvst->client, &jack_pos);

			_timeInfo.samplePos = jack_pos.frame;
			_timeInfo.sampleRate = jack_pos.frame_rate;
			_timeInfo.flags = 0;

			//printf( "get time value=%d\n", value );
			if (jack_pos.valid & JackPositionBBT) {
				_timeInfo.tempo = jack_pos.beats_per_minute;
				_timeInfo.flags |= (kVstTempoValid);
			}
			if (jack_pos.valid & JackPositionBBT) {
				_timeInfo.timeSigNumerator = (long) floor (jack_pos.beats_per_bar);
				_timeInfo.timeSigDenominator = (long) floor (jack_pos.beat_type);
				_timeInfo.flags |= (kVstBarsValid);
			}
			
			if (tstate == JackTransportRolling) {
				_timeInfo.flags |= (kVstTransportChanged|kVstTransportPlaying);
			} else {
				_timeInfo.flags |= (kVstTransportChanged);
			}

		} else {
			_timeInfo.samplePos = 0;
			_timeInfo.sampleRate = 48000;
		}

		return (long)&_timeInfo;

	case audioMasterProcessEvents:
		SHOW_CALLBACK ("amc: audioMasterProcessEvents\n");
		// VstEvents* in <ptr>
		if (jackvst) {
			int i;
			long numEvents;
			VstEvents* events = (VstEvents*)ptr;

			numEvents = events->numEvents;
			for (i = 0; i < numEvents; i++) {
				char* midiData;
				VstMidiEvent* event = (VstMidiEvent*)events->events[i];
				//printf( "delta = %d\n", (int) event->deltaFrames );
				midiData = event->midiData;
				queue_midi_message(jackvst, midiData[0], midiData[1], midiData[2], event->deltaFrames);
			}
		}
		return 1;

	case audioMasterSetTime:
		SHOW_CALLBACK ("amc: audioMasterSetTime\n");
		// VstTimenfo* in <ptr>, filter in <value>, not supported
		return 0;

	case audioMasterTempoAt:
		SHOW_CALLBACK ("amc: audioMasterTempoAt\n");
		memset(&_timeInfo, 0, sizeof(_timeInfo));
		if (jackvst) {
			tstate = jack_transport_query (jackvst->client, &jack_pos);
			return jack_pos.beats_per_minute * 10000.0;
		}
		// returns tempo (in bpm * 10000) at sample frame location passed in <value>
		return 0;

	case audioMasterGetNumAutomatableParameters:
		SHOW_CALLBACK ("amc: audioMasterGetNumAutomatableParameters\n");
		return 0;

	case audioMasterGetParameterQuantization:	
		SHOW_CALLBACK ("amc: audioMasterGetParameterQuantization\n");
		// returns the integer value for +1.0 representation,
		// or 1 if full single float precision is maintained
		// in automation. parameter index in <value> (-1: all, any)
		return 0;

	case audioMasterIOChanged:
		SHOW_CALLBACK ("amc: audioMasterIOChanged\n");
		// numInputs and/or numOutputs has changed
		return 0;

	case audioMasterNeedIdle:
		SHOW_CALLBACK ("amc: audioMasterNeedIdle\n");
		// plug needs idle calls (outside its editor window)
		if( jackvst )
		    jackvst->fst->wantIdle = 1;
		return 1;

	case audioMasterSizeWindow:
		SHOW_CALLBACK ("amc: audioMasterSizeWindow\n");
		// index: width, value: height
		return 0;

	case audioMasterGetSampleRate:
		SHOW_CALLBACK ("amc: audioMasterGetSampleRate\n");
		if( jackvst )
		    return jack_get_sample_rate( jackvst->client );

		return 44100;

	case audioMasterGetBlockSize:
		SHOW_CALLBACK ("amc: audioMasterGetBlockSize\n");
		if( jackvst )
		    return jack_get_buffer_size( jackvst->client );

		return 1024;

	case audioMasterGetInputLatency:
		SHOW_CALLBACK ("amc: audioMasterGetInputLatency\n");
		return 0;

	case audioMasterGetOutputLatency:
		SHOW_CALLBACK ("amc: audioMasterGetOutputLatency\n");
		return 0;

	case audioMasterGetPreviousPlug:
		SHOW_CALLBACK ("amc: audioMasterGetPreviousPlug\n");
	       // input pin in <value> (-1: first to come), returns cEffect*
		return 0;

	case audioMasterGetNextPlug:
		SHOW_CALLBACK ("amc: audioMasterGetNextPlug\n");
	       // output pin in <value> (-1: first to come), returns cEffect*

	case audioMasterWillReplaceOrAccumulate:
		SHOW_CALLBACK ("amc: audioMasterWillReplaceOrAccumulate\n");
	       // returns: 0: not supported, 1: replace, 2: accumulate
		return 0;

	case audioMasterGetCurrentProcessLevel:
		SHOW_CALLBACK ("amc: audioMasterGetCurrentProcessLevel\n");
		// returns: 0: not supported,
		// 1: currently in user thread (gui)
		// 2: currently in audio thread (where process is called)
		// 3: currently in 'sequencer' thread (midi, timer etc)
		// 4: currently offline processing and thus in user thread
		// other: not defined, but probably pre-empting user thread.
		return 0;
		
	case audioMasterGetAutomationState:
		SHOW_CALLBACK ("amc: audioMasterGetAutomationState\n");
		// returns 0: not supported, 1: off, 2:read, 3:write, 4:read/write
		// offline
		return 0;

	case audioMasterOfflineStart:
		SHOW_CALLBACK ("amc: audioMasterOfflineStart\n");
	case audioMasterOfflineRead:
		SHOW_CALLBACK ("amc: audioMasterOfflineRead\n");
		// ptr points to offline structure, see below. return 0: error, 1 ok
		return 0;

	case audioMasterOfflineWrite:
		SHOW_CALLBACK ("amc: audioMasterOfflineWrite\n");
		// same as read
		return 0;

	case audioMasterOfflineGetCurrentPass:
		SHOW_CALLBACK ("amc: audioMasterOfflineGetCurrentPass\n");
	case audioMasterOfflineGetCurrentMetaPass:
		SHOW_CALLBACK ("amc: audioMasterOfflineGetCurrentMetaPass\n");
		return 0;

	case audioMasterSetOutputSampleRate:
		SHOW_CALLBACK ("amc: audioMasterSetOutputSampleRate\n");
		// for variable i/o, sample rate in <opt>
		return 0;

	case audioMasterGetSpeakerArrangement:
		SHOW_CALLBACK ("amc: audioMasterGetSpeakerArrangement\n");
		// (long)input in <value>, output in <ptr>
		return 0;

	case audioMasterGetVendorString:
		SHOW_CALLBACK ("amc: audioMasterGetVendorString\n");
		// fills <ptr> with a string identifying the vendor (max 64 char)
		strcpy ((char*) ptr, "LAD");
		return 0;

	case audioMasterGetProductString:
		SHOW_CALLBACK ("amc: audioMasterGetProductString\n");
		// fills <ptr> with a string with product name (max 64 char)
		strcpy ((char*) ptr, "FreeST");
		return 0;

	case audioMasterGetVendorVersion:
		SHOW_CALLBACK ("amc: audioMasterGetVendorVersion\n");
		// returns vendor-specific version
		return 1000;
		
	case audioMasterVendorSpecific:
		SHOW_CALLBACK ("amc: audioMasterVendorSpecific\n");
		// no definition, vendor specific handling
		return 0;
		
	case audioMasterSetIcon:
		SHOW_CALLBACK ("amc: audioMasterSetIcon\n");
		// void* in <ptr>, format not defined yet
		return 0;
		
	case audioMasterCanDo:
		SHOW_CALLBACK ("amc: audioMasterCanDo\n");
		// string in ptr, see below
		return 0;
		
	case audioMasterGetLanguage:
		SHOW_CALLBACK ("amc: audioMasterGetLanguage\n");
		// see enum
		return 0;
		
	case audioMasterOpenWindow:
		SHOW_CALLBACK ("amc: audioMasterOpenWindow\n");
		// returns platform specific ptr
		return 0;
		
	case audioMasterCloseWindow:
		SHOW_CALLBACK ("amc: audioMasterCloseWindow\n");
		// close window, platform specific handle in <ptr>
		return 0;
		
	case audioMasterGetDirectory:
		SHOW_CALLBACK ("amc: audioMasterGetDirectory\n");
		// get plug directory, FSSpec on MAC, else char*
		return 0;
		
	case audioMasterUpdateDisplay:
		SHOW_CALLBACK ("amc: audioMasterUpdateDisplay\n");
		// something has changed, update 'multi-fx' display
		effect->dispatcher(effect, effEditIdle, 0, 0, NULL, 0.0f);
		return 0;
		
	case audioMasterBeginEdit:
		SHOW_CALLBACK ("amc: audioMasterBeginEdit\n");
		// begin of automation session (when mouse down), parameter index in <index>
		return 0;
		
	case audioMasterEndEdit:
		SHOW_CALLBACK ("amc: audioMasterEndEdit\n");
		// end of automation session (when mouse up),     parameter index in <index>
		return 0;
		
	case audioMasterOpenFileSelector:
		SHOW_CALLBACK ("amc: audioMasterOpenFileSelector\n");
		// open a fileselector window with VstFileSelect* in <ptr>
		return 0;
		
	default:
		SHOW_CALLBACK ("VST master dispatcher: undefed: %d\n", opcode);
		break;
	}	
	
	return 0;
}

