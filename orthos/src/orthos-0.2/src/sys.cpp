
/*
 * Orthos backend functions. Mostly inspired by slim DM code.
 * Big thanks to Per Liden, Simone Rota and Johannes Winkelmann.
 *
 * [exa]
 */

#include "sys.h"
#include "settings.h"
//#define _GNU_SOURCE

#include <sys/types.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <errno.h>

#include <unistd.h>
#include <shadow.h>
#include <pwd.h>
#include <grp.h>

#include <X11/Xlib.h>
#include <X11/Xmu/WinUtil.h>

#include <stdlib.h>
#include <string.h>
#include <string>
#include <iostream>

using namespace std;

/*
 * DEFAULT_PATH is the PATH argument with which the
 * session shall be executed. As long as anyone can set his own session,
 * PLEASE take care of right path setting externally, OR correct it here and
 * mail it to me. thx.
 */
#define DEFAULT_PATH (get_setting("default_path"))

#define XSERVER_PATH (get_setting("Xserver"))
#define XAUTH_PATH (get_setting("Xauth"))
#define SERVER_AUTH (get_setting("server_auth"))
#define SERVER_DISPLAY (get_setting("display"))
#define SERVER_ARGS (get_setting("server_args"))

static Display* active_display;
static pid_t server_pid = 0;
static char magic_cookie[] = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

static void generate_magic_cookie()
{
	static bool random_initd = 0;

	if (!random_initd) {
		struct timeval tv;
		struct timezone tz;
		gettimeofday (&tv, &tz);
		srand (tv.tv_sec ^ tv.tv_usec);
		random_initd = 1;
	}

	char p[] = "0123456789abcdef";
	for (int i = 0; i < 32;++i) magic_cookie[i] = p[rand() %16];
}

static int server_timeout (int time)
{
	pid_t p;

	do {
		p = waitpid (server_pid, 0, WNOHANG);
		if (p == server_pid) return 0;
		usleep (10000);
	} while ( (time--) > 0);

	return 1;
}

int x_server_blank ()
{
	Display*d=active_display;
	if(!d)return 1;
	GC gc = XCreateGC(d, DefaultRootWindow(d), 0, 0);
	XSetForeground(d,gc,BlackPixel(d,DefaultScreen(d)));
	XFillRectangle(d,DefaultRootWindow(d),gc,0,0,
		XWidthOfScreen(ScreenOfDisplay(d,DefaultScreen(d))),
		XWidthOfScreen(ScreenOfDisplay(d,DefaultScreen(d))));
	XFlush(d);
	XFreeGC(d,gc);
	return 0;
}

static int wait_for_server()
{
	for (int i = 0;i < 30;++i)
		if ( (active_display = XOpenDisplay (SERVER_DISPLAY) ) )
			return 0; //ok
		else if (!server_timeout (1) ) return 2; //server died
	return 1; //timeout
}

static int add_xauth (const char*fn)
{
	unlink(fn);
	string cmd =
		string (XAUTH_PATH) + " -q -f " + fn +
		" add " + SERVER_DISPLAY +
		" . " + magic_cookie;

	/*
	 * note: system() may possibly fail to set xauth.
	 * but then the process might get ressurected somehow
	 * by some client scripts, so we don't suppose that
	 * it's all doomed.
	 *
	 * Also, auth number could be possibly seen in ps ax.
	 * too bad. lol.
	 */
	return system (cmd.c_str() );
}

static void signal_handler(int n)
{
	cerr << "killed by signal: " << n << endl;
	x_server_stop();
	orthos_kill(n);
}

static int catch_error (Display*dpy, XErrorEvent*ev)
{
	return 0;
}

int sys_setup()
{
	signal (SIGTTIN, SIG_IGN);
	signal (SIGTTOU, SIG_IGN);
	signal (SIGUSR1, SIG_IGN);
	signal (SIGHUP, SIG_IGN);
	signal (SIGQUIT, signal_handler);
	signal (SIGTERM, signal_handler);
	signal (SIGINT, signal_handler);
	signal (SIGKILL, signal_handler);
	signal (SIGALRM, SIG_IGN);
	XSetErrorHandler (catch_error);
	return 0;
}

int sys_reset_signals()
{
	signal (SIGTTIN, SIG_DFL);
	signal (SIGTTOU, SIG_DFL);
	signal (SIGUSR1, SIG_DFL);
	signal (SIGHUP, SIG_DFL);
	signal (SIGQUIT, SIG_DFL);
	signal (SIGTERM, SIG_DFL);
	signal (SIGINT, SIG_DFL);
	signal (SIGKILL, SIG_DFL);
	signal (SIGALRM, SIG_DFL);
	return 0;
}

int x_server_start ()
{
	if (server_pid) if (!x_server_running() ) x_server_stop();
	server_pid = 0;

	generate_magic_cookie();

	pid_t p = fork();
	if (!p) { //spawned process
		if(add_xauth (SERVER_AUTH)) exit(-2);
		//close(0);
		//close(1);
		//close(2);

		setpgid (0, getpid() );

		string cmdline = string (XSERVER_PATH) +
				 " " + SERVER_DISPLAY +
				 " -auth " + SERVER_AUTH +
				 " " + SERVER_ARGS;

		sys_exec (cmdline.c_str() );
		exit (-1);
	}
	if (p < 0) return -1; //too bad

	server_pid = p;
	
	if(!server_timeout(5)) {
		cerr <<"server timed out"<<endl;
		return 1;
	}

	setenv ("XAUTHORITY", SERVER_AUTH, 1);
	setenv ("DISPLAY", SERVER_DISPLAY, 1);

	if (int t=wait_for_server() ) {
		cerr << "server connection timed out "<<t<<endl;
		server_pid = 0;
		return 2;
	}

	x_server_blank();

	//evarything seemez ok

	return 0;
}

int x_server_stop ()
{
	if(!server_pid) return 0; //alrdy stopped

	if(active_display) XCloseDisplay(active_display);

	active_display=0;

	unsetenv("XAUTHORITY");
	unsetenv("DISPLAY");

	errno = 0;
	if (killpg (server_pid, SIGTERM) < 0) {
		if (errno == EPERM) return -1;
		if (errno == ESRCH) return 0; //possibly killed now
	}

	if (!server_timeout (10) ) { //shutdown wait
		//shutdown ok
		return 0;
	}

	errno = 0;
	if (killpg (server_pid, SIGKILL) < 0)
		if (errno == ESRCH) return 0;

	if (server_timeout (3) )
		//server didn't die
		return -2;

	//evarything ouk
	server_pid=0;

	unlink(SERVER_AUTH);

	return 0;
}

int x_server_running ()
{
	Display*d = XOpenDisplay (SERVER_DISPLAY);
	if (!d) return 1;
	XCloseDisplay (d);
	return 0;
}

int x_get_resolution (int*x, int*y)
{
	XWindowAttributes attribs;
	*x=0;*y=0;
	Display*d=active_display;
	if(!d)return 1;
	XGetWindowAttributes(d,DefaultRootWindow(d),&attribs);
	*x=attribs.width;
	*y=attribs.height;
	return 0;
}

int sys_auth_user (const char*username, const char*password)
{
	struct passwd*pw;
	struct spwd*sp;
	char*encrypted, *correct;

	pw = getpwnam (username);
	endpwent();

	if (!pw) return 1; //user doesn't really exist

	sp = getspnam (pw->pw_name);
	endspent();
	if (sp)
		correct = sp->sp_pwdp;
	else
		correct = pw->pw_passwd;

	encrypted = crypt (password, correct);
	return strcmp (encrypted, correct) ? 2 : 0;  // bad pw=2, success=0
}

int sys_do_login_user (const char*username, const char*session)
{
	if (!server_pid) return -2; //server lack lol.
	x_server_blank();
	XCloseDisplay(active_display); //server killing protection
	active_display=0;

	struct passwd*pw;

	pw = getpwnam (username);
	endpwent();
	if (!pw) return -1; //user not found

	//check against empty shells
	if (pw->pw_shell[0] == 0) {
		setusershell();
		strcpy (pw->pw_shell, getusershell() );
		endusershell();
	}

	//fork off
	pid_t pid;
	pid = fork();
	if (!pid) { //spawned child

		string xauth_file = string (pw->pw_dir) + "/.Xauthority";

		chdir(pw->pw_dir);

		//set all the environment (we shall inherit the rest)
		setenv ("HOME", pw->pw_dir, 1);
		setenv ("SHELL", pw->pw_shell, 1);
		setenv ("USER", pw->pw_name, 1);
		setenv ("LOGNAME", pw->pw_name, 1);
		//setenv ("PATH", DEFAULT_PATH, 1);
		//path can be default ok?
		setenv ("DISPLAY", SERVER_DISPLAY, 1);
		setenv ("XAUTHORITY", xauth_file.c_str(), 1);

		//switch UID and stuff

		if	(initgroups (pw->pw_name, pw->pw_gid) ||
				setgid (pw->pw_gid) ||
				setuid (pw->pw_uid) )

			exit (-1);


		//write xauth
		add_xauth (xauth_file.c_str() );

		//now charge da laz0rz and exec session.
		sys_exec(session,pw->pw_shell,true);
	}

	if (pid == -1)
		//failed to fork. die.
		return -2;


	//wait for session.
	pid_t wpid = -1;
	int status = 0;
	while (wpid != pid) wpid = wait (&status);

	killpg (server_pid, SIGHUP);

	sleep(1); //so we dont get killed along

	active_display=XOpenDisplay(SERVER_DISPLAY);
	if(!active_display)return -3;

	return status;
}

int sys_exec (const char*cmd, const char*shell, bool login)
{
	/*
	 * use the shell and builtins to parse the arguments.
	 * it's not the fastest, but surely the cleanest way.
	 */

	string a = "exec ";
	a += cmd;
	char*args[] = {login?(char*)((string("-")+shell).c_str()):(char*)shell, (char*)"-c", (char*) (a.c_str() ), 0};
	return execve (shell, args, environ);
}

int sys_spawn(const char*cmd, const char*shell)
{
	pid_t p=fork();
	if(p<0)return 1;
	if(p) return 0;
	setsid();
	if(sys_exec(cmd,shell))_exit(1);
	return -1; //definately bad here!
}

int fork_to_background()
{
	pid_t p=fork();
	if(p) return p; //also handles errors

	if(!get_bool_setting("debug")) {
		close(0);
		close(1);
		close(2);
	}
	setsid();
	return 0;
}


