#include <stdio.h>
#include <fst.h>
#include <aeffectx.h>

long amc (AEffect* effect,
	  long opcode,
	  long index,
	  long value,
	  void* ptr,
	  float opt)
{
	switch (opcode) {
	case audioMasterVersion:
		return 2;
	default:
		return 0;
	}
}

void
fst_signal_handler (int sig, siginfo_t* info, void* context)
{
	fst_error ("fst signal handler %d, thread = 0x%x", sig, pthread_self ());
	exit (1);
}

void vst_print (AEffect *plugin)
{
	unsigned i;
	char name[9];
	char display[25];
	char label[9];
	char bigbuf[1024];
	int vst_version;

	printf ("inputs: %i\n", plugin->numInputs);
	printf ("outputs: %i\n", plugin->numOutputs);
	printf ("params: %i\n", plugin->numParams);
	printf ("programs: %i\n", plugin->numPrograms);
	printf ("HasEditor ? %i\n", plugin->flags & effFlagsHasEditor);
// 	printf ("can HasClip ? %ld\n", plugin->flags & effFlagsHasClip);
// 	printf ("can HasVu ? %ld\n", plugin->flags & effFlagsHasVu);
// 	printf ("can CanMono ? %ld\n", plugin->flags & effFlagsCanMono);
	printf ("CanReplacing ? %i\n", plugin->flags & effFlagsCanReplacing);
// 	printf ("can ProgramChunks ? %ld\n", plugin->flags & effFlagsProgramChunks);

	plugin->dispatcher (plugin, effGetVendorString, 0, 0, bigbuf, 0);
	printf ("Vendor: %s\n", bigbuf);
	plugin->dispatcher (plugin, effGetProductString, 0, 0, bigbuf, 0);
	printf ("Product: %s\n", bigbuf);
// 	printf ("Version: %d\n", plugin->dispatcher (plugin, effGetVendorVersion, 0, 0, NULL, 0.0f));

#if 0
	vst_version = plugin->dispatcher (plugin, effGetVstVersion, 0, 0, NULL, 0.0f);

// 	if (vst_version >= 2) {
// 		printf ("Needs keypresses? %d\n",
// 			plugin->dispatcher (plugin, effKeysRequired, 0, 0, NULL, 0.0f));
// 	}

	for (i = 0; i < plugin->numParams; i++) {

		/* the Steinberg(tm) way... */

		if (i == 0) {
			printf ("Control input/output(s):\n");
		}

		memset (name, 0, 9);
		memset (display, 0, 25);
		memset (label, 0, 9);

		plugin->dispatcher (plugin,
				    effGetParamName,
				    i, 0, name, 0);

// 		plugin->dispatcher (plugin,
// 				    effGetParamDisplay,
// 				    i, 0, display, 0);
		plugin->dispatcher (plugin,
				    effGetParamLabel,
				    i, 0, label, 0);
		printf (" #%d \"%s\" (%s %s)\n",
			i + 1, name, display, label);
	}
#endif
}

int main (int argc, char *argv[])
{
	FSTHandle* handle;
	FST* fst;

	if (fst_init (fst_signal_handler)) {
		return;
	}

	if ((handle = fst_load (argv[1])) == NULL) {
		return -1;
	}

	if ((fst = fst_instantiate (handle, amc, 0)) == NULL) {
		return -1;
	}

	vst_print (fst->plugin);

	exit (0);
}
