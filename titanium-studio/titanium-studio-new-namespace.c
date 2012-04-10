/*
 * from 
 * http://developer.appcelerator.com/question/123123/change-the-python-command-used-by-the-mobilesdk--titanium-studio#answer-218276
 */

#define _GNU_SOURCE
#include <sched.h>
#include <syscall.h>
#include <unistd.h>
 
int main(int argc, char *argv[]) 
{
	syscall(SYS_unshare, CLONE_NEWNS);
	if (argc > 1)
		return execvp(argv[1], &argv[1]);
	return execv("/bin/sh", NULL);
}

