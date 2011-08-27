
#include "ui.h"
#include "skinload.h"
#include "settings.h"
#include "sys.h"
#include "orthos.h"

#include <iostream>
using namespace std;

static skin_init_func s_init;
static skin_fini_func s_fini;
static skin_start_func s_start;
static skin_stop_func s_stop;
static skin_update_func s_update;

int ui_init()
{
	if(load_skin(get_setting("skin"),
		&s_init, &s_fini, &s_start, &s_stop, &s_update))
		return 1;
	
	int x=0,y=0;
	x_get_resolution(&x,&y);

	s_init(x,y,orthos_validate_login,
		orthos_do_login, orthos_action,
		orthos_get_config);

	cout << "skin inited ok" << endl;
	
	return 0;
}

int ui_release()
{
	s_fini();
	free_skin();
	return 0;
}

int ui_run()
{
	if(s_start()) return 1;
	int r;
	while((r=s_update())==1);
	if(r)return 2; //update exited with error status
	s_stop();
	return 0;
}

