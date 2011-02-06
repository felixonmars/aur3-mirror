
#ifndef ORTHOS_SKINLOAD_H
#define ORTHOS_SKINLOAD_H

#include "skin.h"

int load_skin (const char*fn,
	       skin_init_func*,
	       skin_fini_func*,
	       skin_start_func*,
	       skin_stop_func*,
	       skin_update_func*);

int free_skin();

#endif

