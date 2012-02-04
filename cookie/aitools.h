/* AITOOLS.H
 *
 * A set of functions, structs, and macros
 * that supplies the necesities of AI secretary
 * programming.
 *
 * March 7, 2010
 * by Oliver Katz (Lexion on the Arch Linux BBS) */

#ifndef __AITOOLS_H
#define __AITOOLS_H

/************/
/* INCLUDES */
/************/
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <malloc.h>
#include <time.h>
#include <stdlib.h>

/**********/
/* MACROS */
/**********/

/* Used as values for srcctrl in aiinfo */
#define INFO_GIT 0
#define INFO_NONE 1

/* Array lengths */
#define NNOTES 4096
#define NDATES 4096
#define NCLAN 8182
#define NCMEM 8182

/* Directory names */
#define DNOTES "/.aitools/notes/" // should be prefixed with $HOME

/*********************/
/* TYPES AND STRUCTS */
/*********************/

/* aiinfo
 *
 * Stores information about the AI as well as
 * troubleshooting help. */
struct
{
	/* Name of the AI */
	char *name;
	
	/* Where some common files are kept in the
	 * project directory */
	struct
	{
		char *readme;
		char *copying;
		char *manual;
	} files;

	/* What common directories are called */
	struct
	{
		char *src;
		char *doc;
	} dirs;

	/* What kind of source control you have */
	enum // all I support right now is git
	{
		git,
		none
	} srcctrl;

	/* Installation instructions */
	struct
	{
		char *build;
		char *clean;
		char *install;
	} cmds;

	/* Web help */
	struct
	{
		char *mainpage;
		char *wiki;
		char *forum;
		char *mailinglist;
	} urls;
} aiinfo;

/* Simple file handle */
typedef struct _fhandle
{
	char *name;
	long length;
	FILE *ptr;

	char *content;
} _fhandle;
typedef _fhandle *fhandle;

/* Stores .clan info */
typedef enum clan_type
{
	sinonym,
	strip
} clan_type;

typedef struct clan
{
	clan_type type;
	char *key;
	char *val;
} clan;

/* Stores .cmem info */
typedef struct cmem
{
	char *key;
	char *val;
} cmem;

/* Stores note */
typedef struct _note
{
	char *raw;
	char *con; // consolidated version
	char *fac; // facts-only version

	char *title;
	char *cat; // catagory
} _note;
typedef _note *note;

/* Stores time */
typedef struct _date
{
	int day;
	int rep;
	char *name;
} _date;
typedef _date *date;

/********************/
/* GLOBAL VARIABLES */
/********************/

date dates[NDATES];

fhandle ga_clan_fh;
fhandle ga_cmem_fh;

clan ga_clan[NCLAN];
cmem ga_cmem[NCMEM];

// options:
int opt_color;

/*******************/
/* MACRO FUNCTIONS */
/*******************/
#define col_red() if (opt_color) printf("\033[0;31m");
#define col_green() if (opt_color) printf("\033[0;32m");
#define col_yellow() if (opt_color) printf("\033[0;33m");
#define col_blue() if (opt_color) printf("\033[0;34m");
#define col_magenta() if (opt_color) printf("\033[0;35m");
#define col_cyan() if (opt_color) printf("\033[0;36m");
#define col_grey() if (opt_color) printf("\033[0;37m");
#define col_default() if (opt_color) printf("\033[0;28m");

/************************/
/* FUNCTION DEFINITIONS */
/************************/

/* Definitions of built-in function to avoid
 * warnings at compile-time */
char *strdup(const char *s);
char *strndup(const char *s, size_t n);

/* Runs the standard INIT routine. If 'verbose'
 * is 1, it will display debug info. If 'verbose'
 * is 0, it won't. Example debug info:
 *
 * init memspace
 * setting AI info
 * loading config
 * loading resources */
void at_std_init(int verbose);

/* INIT routine for info module */
int info_init();

/* Tell aiinfo where things are */
void info_readme(char *f);
void info_copying(char *f);
void info_manual(char *f);
void info_src(char *d);
void info_doc(char *d);
void info_srcctrl(int type);
void info_build(char *c);
void info_clean(char *c);
void info_install(char *c);
void info_mainpage(char *u);
void info_wiki(char *u);
void info_forum(char *u);
void info_mailinglist(char *u);

/* Basic functions */
int info_troubleshoot(int whereis, int whereis_dir, int srcctrl, int build, int giveurlhelp);
int err_out(char *from, char *desc, int fatal, int warning);
int strcontains(char *s, char *words[]);

/* File handle managment */
fhandle fhandle_new();
int fhandle_open(fhandle fh, char *fname);
int fhandle_close(fhandle fh);
int fhandle_load(fhandle fh);
char *fhandle_get(fhandle fh);
int fhandle_write(fhandle fh, char *text);

/* .clan file format */
int clan_new(clan c[], long length);
int clan_load(clan c[], long length, fhandle fh);
int clan_check_strip(clan c[], long length, char *s);
char *clan_get_sinonym(clan c[], long length, char *s);
int clan_new_sinonym(clan c[], long length, char *k, char *v);
int clan_write(clan c[], long length, fhandle fh);

/* .cmem file format */
int cmem_new(cmem c[], long length);
int cmem_load(cmem c[], long length, fhandle fh);
char *cmem_query(cmem c[], long length, char *key);
int cmem_add(cmem c[], long length, char *key, char *val);
int cmem_write(cmem c[], long length, fhandle fh);

/* Grammar analysis system */
int ga_init();
char *ga_strip(char *s);
char *ga_replace_sinonyms(char *s);
char *ga_process(char *s);
int ga_compare(char *a, char *b);

/* Date handling */
date date_new(char *when);
int date_check(date d);
int dates_clean();

/* Personal assistant functions */
int pa_init();

int pa_note_new(char *title);
int pa_note_process(char *title);
int pa_note_query(char *title);
int pa_note_view(char *title);

char *pa_rem_get();

#endif
