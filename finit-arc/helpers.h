#ifndef __FINIT_HELPERS_H
#define __FINIT_HELPERS_H

int	makepath	(char *);
void	copyfile	(char *, char *, int);
int	getgroup	(char *);

#ifdef BUILTIN_RUNPARTS
int	run_parts	(char *, ...);
#endif

#endif
