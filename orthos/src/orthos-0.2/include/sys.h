
#ifndef ORTHOS_SYS_H
#define ORTHOS_SYS_H

int fork_to_background ();

int x_server_start ();
int x_server_stop ();
int x_server_running (); //1 if server was stopped somehow
int x_get_resolution (int*, int*);
int x_server_blank ();

int sys_setup();
int sys_reset_signals();

int sys_auth_user (const char*username, const char*pw);
//return 0 if the login data is correct

int sys_do_login_user (const char*username, const char*session);
//login the user, and return 0 if the session ended correctly

int sys_exec (const char*cmd, const char* shell="/bin/sh", bool login=false);
//is not supposed to return, only on error

int sys_spawn (const char*cmd, const char*shell="/bin/sh");
//forks off an exec

#endif

