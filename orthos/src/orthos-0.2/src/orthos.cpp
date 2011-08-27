
#include "orthos.h"
#include "skinload.h"
#include "settings.h"
#include "sys.h"
#include "ui.h"

#include <unistd.h>

#include <string>
#include <iostream>
using namespace std;

static int g_action=0;
#define action_login 1
#define action_command 2
static string g_login_name, g_command;

static int g_killed=0;

int orthos_main (int argc, char**argv)
{
	load_config(argc,argv);

	{int t=fork_to_background();
		if(t>0)return 0;
		if(t<0)return 1;
	}
	
	sys_setup();

	if(x_server_start()) goto error;

	//if(x_server_running()) goto error;
	
	if(ui_init()) goto error;

	while(!g_killed) {
		if(ui_run()){
			if(x_server_running()) {
				if(g_killed) goto exit;
				x_server_start();
				continue;
			}
			else goto error;
		}

		switch(g_action) {
		case action_login:
			sys_do_login_user(g_login_name.c_str(),
				g_command.c_str());
			if(x_server_running()) //server dead
				{if(g_killed) goto exit;
				if(x_server_start())goto error;}
			else if (get_bool_setting("restart_after_session")){
				x_server_stop();
				if(x_server_start())goto error;
			}	
			break;
		case action_command:
			sys_spawn(g_command.c_str());
			goto terminate;
			break;
		default:
			goto error;
			break;
		}
	}

exit:
	ui_release();
	x_server_stop();
	free_config();
	return 0;
error:
	ui_release();
	x_server_stop();
	free_config();
	return 1;

terminate:
	ui_release();
	x_server_stop();
	sys_reset_signals();
	free_config();
	return 0;
}


int orthos_kill(int signal)
{
	return g_killed = signal;
}


/*
 * following functions are exported to the plugin.
 */

#include "skin.h"

int orthos_validate_login(const char*name, const char*pw)
{
	return sys_auth_user (name,pw);
}

int orthos_do_login(const char*name, const char*session)
{
	g_action = action_login;
	g_login_name=name;
	g_command=session;
	return 0;
}

int orthos_action(const char*command)
{
	g_action = action_command;
	g_command=command;
	return 0;
}

const char* orthos_get_config(const char*x)
{
	return get_setting(x);
}

