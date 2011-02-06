
#ifndef ORTHOS_SETTINGS_H
#define ORTHOS_SETTINGS_H

#include "orthos.h"

int load_config (int argc, char**argv);
int free_config ();

const char* get_setting (const char*);
int get_int_setting (const char*);
bool get_bool_setting (const char*);

#endif
