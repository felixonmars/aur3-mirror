
#include "skinload.h"

#include <dlfcn.h>
#include <iostream>
using namespace std;

static void* h = 0; //handle to library

int load_skin (const char*fn,
	       skin_init_func*f_init,
	       skin_fini_func*f_fini,
	       skin_fini_func*f_start,
	       skin_fini_func*f_stop,
	       skin_update_func*f_update)
{
	if (h) free_skin();

	*f_init = 0;
	*f_fini = 0;
	*f_start = 0;
	*f_stop = 0;
	*f_update = 0;

	h = dlopen (fn, RTLD_NOW);
	if (!h){
		cerr << "skin loading error: " << dlerror() << endl;
		return 1; //not found or wat
	}

	*f_init = (skin_init_func) dlsym (h, "orthos_skin_init");
	*f_fini = (skin_fini_func) dlsym (h, "orthos_skin_fini");
	*f_start = (skin_start_func) dlsym (h, "orthos_skin_start");
	*f_stop = (skin_stop_func) dlsym (h, "orthos_skin_stop");
	*f_update = (skin_update_func) dlsym (h, "orthos_skin_update");

	//because of sanity, one of following funcs must be defined.
	if ( (*f_init) &&
		(*f_fini) &&
		(*f_start) &&
		(*f_stop) &&
		(*f_update) ) return 0;
	return 2;
}

int free_skin()
{
	if (h) dlclose (h);
	h=0;
	return 0;
}

