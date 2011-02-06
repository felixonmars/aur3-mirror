#ifndef __jack_vst_h__
#define __jack_vst_h__

#include <sys/types.h>
#include <sys/time.h>
#include <jack/jack.h>
#include <jack/ringbuffer.h>
#include <fst.h>
#include <alsa/asoundlib.h>

typedef struct _JackVST JackVST;

struct _JackVST {
    jack_client_t *client;
    FSTHandle*     handle;
    FST*           fst;
    float        **ins;
    float        **outs;
    jack_port_t  *midi_inport;
    jack_port_t  *midi_outport;
    jack_port_t  **inports;
    jack_port_t  **outports;
    void*          userdata;
    int            bypassed;
    int            muted;
    int			   current_program;

    int			   midi_map[128];
    volatile int   midi_learn;
    volatile int   midi_learn_CC;
    volatile int   midi_learn_PARAM;

    int			   resume_called;

    /* For VST/i support */
    int want_midi_in;
    struct VstMidiEvent* event_array;
    struct VstEvents*    events;

    /* For VST midi effects & synth source (like audio to midi VSTs) support */
    jack_ringbuffer_t* ringbuffer;
};

#define MIDI_EVENT_MAX 1024

#endif /* __jack_vst_h__ */
