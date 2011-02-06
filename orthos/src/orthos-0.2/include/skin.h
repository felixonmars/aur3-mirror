

#ifndef ORTHOS_SKIN_H
#define ORTHOS_SKIN_H

#include "orthos.h"

extern "C"
{

//these should be defined in the skin.
//all return 1 on error, 0 otherwise.
//(should return 0 if possible:D)

	typedef int (*orthos_validate_login_func) (const char*, const char*);
	typedef int (*orthos_do_login_func) (const char*, const char*);
	typedef int (*orthos_action_func) (const char*);
	typedef const char* (*orthos_get_config_func)(const char*);
	typedef int (*skin_init_func) (int, int,
		orthos_validate_login_func,
		orthos_do_login_func,
		orthos_action_func,
		orthos_get_config_func);
	typedef int (*skin_fini_func) ();
	typedef int (*skin_start_func) ();
	typedef int (*skin_stop_func) ();
	typedef int (*skin_update_func) ();

	//load/unload
	int orthos_skin_init (int x, int y,
		orthos_validate_login_func,
		orthos_do_login_func,
		orthos_action_func,
		orthos_get_config_func);
	int orthos_skin_fini();

	//show start/stop
	int orthos_skin_start ();
	int orthos_skin_stop ();

	int orthos_skin_update ();
		//regular update (should draw),
		//should return 0 when finished, 1 when need another frame,
		//otherwise on error. Must handle timing itself.

//these are exported to the skin:

//returns 0 if login is valid
	int orthos_validate_login (const char*name, const char*pw);
//if it is valid, then the login data is stored
//in the core. Skin usually plays a wonderful animation
//of login success and then calls this:
	int orthos_do_login (const char*name, const char* session);
//which terminates all (causing the call of orthos_skin_stop())
//and runs the plugin environment.
	int orthos_action (const char* command);
//performs an action by running the command as root.
//orthos_skin_fini is called, orthos gets terminated and command
//is then executed. Usuable for shutdown/reboot things.

	const char* orthos_get_config (const char*);
	//may return 0!

} //extern "C"

#endif

