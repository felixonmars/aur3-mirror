#include <stdio.h>
#include "aitools.h"
#undef __AITOOLS_H

void at_std_init(int verbose)
{
	col_grey();

	if (verbose)
		printf("init memspace\n");
	info_init();

	if (verbose)
		printf("setting AI info\n");
	info_readme("README");
	info_copying("COPYING");
	info_src(".");
	info_doc("doc");
	info_srcctrl(INFO_NONE);
	info_build("make");
	info_clean("make clean");
	info_install("sudo make install");

	col_default();
}

int info_init()
{
	aiinfo.name = NULL;

	aiinfo.files.readme = NULL;
	aiinfo.files.copying = NULL;
	aiinfo.files.manual = NULL;

	aiinfo.dirs.src = NULL;
	aiinfo.dirs.doc = NULL;

	aiinfo.srcctrl = none;

	aiinfo.cmds.build = NULL;
	aiinfo.cmds.clean = NULL;
	aiinfo.cmds.install = NULL;

	aiinfo.urls.mainpage = NULL;
	aiinfo.urls.wiki = NULL;
	aiinfo.urls.forum = NULL;
	aiinfo.urls.mailinglist = NULL;

	return 0;
}

void info_readme(char *f)
{ aiinfo.files.readme = strdup(f); }
void info_copying(char *f)
{ aiinfo.files.copying = strdup(f); }
void info_manual(char *f)
{ aiinfo.files.manual = strdup(f); }
void info_src(char *d)
{ aiinfo.dirs.src = strdup(d); }
void info_doc(char *d)
{ aiinfo.dirs.doc = strdup(d); }
void info_srcctrl(int type)
{ aiinfo.srcctrl = type; }
void info_build(char *c)
{ aiinfo.cmds.build = strdup(c); }
void info_clean(char *c)
{ aiinfo.cmds.clean = strdup(c); }
void info_install(char *c)
{ aiinfo.cmds.install = strdup(c); }
void info_mainpage(char *u)
{ aiinfo.urls.mainpage = strdup(u); }
void info_wiki(char *u)
{ aiinfo.urls.wiki = strdup(u); }
void info_forum(char *u)
{ aiinfo.urls.forum = strdup(u); }
void info_mailinglist(char *u)
{ aiinfo.urls.mailinglist = strdup(u); }

int info_troubleshoot(int whereis, int whereis_dir, int srcctrl, int build, int giveurlhelp)
{
	col_blue();
	printf("\nTROUBLESHOOTING INFO\n\n");
	col_default();
	if (whereis)
	{
		printf("The locations of files are as follows:\n");
		if (aiinfo.files.readme)
			printf("Readme:		%s\n", aiinfo.files.readme);
		if (aiinfo.files.copying)
			printf("Licence:	%s\n", aiinfo.files.copying);
		if (aiinfo.files.manual)
			printf("Manual:		%s\n", aiinfo.files.manual);
		printf("\n");
	}

	if (whereis_dir)
	{
		if (aiinfo.dirs.src)
			printf("The source code is located in '%s'\n", aiinfo.dirs.src);
		if (aiinfo.dirs.doc)
			printf("The documentation is located in '%s'\n", aiinfo.dirs.doc);
		printf("\n");
	}

	if (srcctrl)
	{
		if (aiinfo.srcctrl == git)
		{
			printf("This AI uses git. The commands for\n");
			printf("using git are as follows:\n");
			printf("View logs: git log\n");
		}
		else if (aiinfo.srcctrl == none)
		{
			printf("This AI doesn't use any source control\n");
			printf("that is recognized by AIInfo.\n");
			printf("Available are:\n");
			printf("git\n");
		}

		printf("\n");
	}

	if (build)
	{
		col_blue();
		printf("Basic installation instructions:\n");
		col_default();
		if (aiinfo.cmds.build)
			printf("Build: %s\n", aiinfo.cmds.build);
		if (aiinfo.cmds.install)
			printf("Install: %s\n", aiinfo.cmds.install);
		if (aiinfo.cmds.clean)
		{
			printf("\n");
			printf("If you get problems during the 'Build'\n");
			printf("step, try the following command:\n");
			printf("Clean: %s\n", aiinfo.cmds.clean);
		}
		printf("\n");
	}

	if (giveurlhelp)
	{
		col_blue();
		printf("Web help:\n");
		col_default();
		if (aiinfo.urls.mainpage)
			printf("Website:	%s\n", aiinfo.urls.mainpage);
		if (aiinfo.urls.wiki)
			printf("Wiki:		%s\n", aiinfo.urls.wiki);
		if (aiinfo.urls.forum)
			printf("Forum:		%s\n", aiinfo.urls.forum);
		if (aiinfo.urls.mailinglist)
			printf("Mailinglist:%s\n", aiinfo.urls.mailinglist);
		printf("\n");
	}

	return 0;
}

int err_out(char *from, char *desc, int fatal, int warning)
{
	if (warning)
	{
		col_yellow();
		printf("warning [%s] ", from);
	}
	else
	{
		col_red();
		if (fatal)
			printf("***FATAL*** [");
		else
			printf("***ERROR*** [");
		printf("%s] *** ", from);
	}

	printf("%s\n", desc);
	col_default();
	if (fatal)
		_exit(1);
	return 0;
}

int strcontains(char *s, char *words[])
{
	if (!s)
		return 0;

	for (int i = 0; words[i] != NULL; i++)
	{
		if (strstr(s, words[i]) == NULL)
			return 0;
	}

	return 1;
}

fhandle fhandle_new()
{
	fhandle tmp = (fhandle)malloc(sizeof(_fhandle));
	tmp->name = NULL;
	tmp->length = 0;
	tmp->ptr = NULL;
	tmp->content = NULL;

	return tmp;
}

int fhandle_open(fhandle fh, char *fname)
{
	fh->name = strdup(fname);
	char *tmp = (char *)malloc(1024*sizeof(char));
	sprintf(tmp, "touch %s", fname);
	system(tmp);
	free(tmp);
	tmp = NULL;
	fh->ptr = fopen(fname, "r+");
	if (fh->ptr)
	{
		fseek(fh->ptr, 0, SEEK_END);
		fh->length = ftell(fh->ptr);
		rewind(fh->ptr);
		return 0;
	}
	else
	{
		printf("[DEBUG] file name: '%s'\n", fname);
		err_out("fhandle_open", "can't open file", 1, 0);
		return 1;
	}
}

int fhandle_close(fhandle fh)
{
	if (fh->ptr)
		fclose(fh->ptr);

	if (fh->content)
	{
		free(fh->content);
		fh->content = NULL;
	}

	return 0;
}

int fhandle_load(fhandle fh)
{
	if (!fh)
		return 1;

	fh->content = (char *)malloc(fh->length*sizeof(char));
	if (!fh->content)
		return 1;
	memset(fh->content, 0, fh->length*sizeof(char));
	rewind(fh->ptr);
	fread(fh->content, sizeof(char), fh->length, fh->ptr);
	return 0;
}

char *fhandle_get(fhandle fh)
{
	return fh->content;
}

int fhandle_write(fhandle fh, char *text)
{
	fseek(fh->ptr, 0, SEEK_SET);
	fwrite(text, sizeof(char), strlen(text), fh->ptr);
	return 1;
}

int clan_new(clan c[], long length)
{
	for (int i = 0; i < length; i++)
	{
		c[i].type = sinonym;
		c[i].key = NULL;
		c[i].val = NULL;
	}

	return 0;
}

int clan_load(clan c[], long length, fhandle fh)
{
	fhandle_load(fh);
	char *page = fhandle_get(fh);
	int i = 0;

	for (char *p = strtok(page, "\n"); p != NULL; p = strtok(NULL, "\n"))
	{
		if (p[0] == '-')
		{
			c[i].type = strip;
			c[i].val = strdup(p+1);
			c[i].key = NULL;
		}
		else if (p[0] == 'S')
		{
			c[i].type = sinonym;
			c[i].key = strndup(p+1, strchr(p, '<')-p-1);
			c[i].val = strdup(strchr(p, '<')+1);
		}
		else
		{
			err_out("clan_load", "unknown line cmd", 0, 0);
		}

		i++;
	}

	return 0;
}

int clan_check_strip(clan c[], long length, char *s)
{
	for (int i = 0; i < length; i++)
	{
		if (c[i].type == strip)
		{
			if (strcmp(c[i].val, s) == 0)
				return 1;
		}
	}

	return 0;
}

char *clan_get_sinonym(clan c[], long length, char *s)
{
	for (int i = 0; i < length; i++)
	{
		if (c[i].type == sinonym && c[i].key)
		{
			if (strcmp(c[i].key, s) == 0)
				return c[i].val;
		}
	}

	return NULL;
}

int clan_new_sinonym(clan c[], long length, char *k, char *v)
{
	for (int i = 0; i < length; i++)
	{
		if (c[i].val == NULL && c[i].key == NULL)
		{
			c[i].type = sinonym;
			c[i].key = strdup(k);
			c[i].val = strdup(v);
			return 0;
		}
	}

	return 1;
}

int clan_write(clan c[], long length, fhandle fh)
{
	long newlen = 32;

	for (int i = 0; i < length; i++)
	{
		if (c[i].key)
			newlen+=strlen(c[i].key)+3;
		if (c[i].val)
			newlen+=strlen(c[i].val)+2;
	}

	char *tmp = (char *)malloc(newlen*sizeof(char));
	memset(tmp, 0, newlen*sizeof(char));

	for (int i = 0; i < length; i++)
	{
		if (c[i].type == strip)
		{
			if (c[i].val)
			{
				strcat(tmp, "-");
				strcat(tmp, c[i].val);
				strcat(tmp, "\n");
			}
		}
		else if (c[i].type == sinonym)
		{
			if (c[i].val && c[i].key)
			{
				strcat(tmp, "S");
				strcat(tmp, c[i].key);
				strcat(tmp, "<");
				strcat(tmp, c[i].val);
				strcat(tmp, "\n");
			}
		}
	}

	fhandle_write(fh, tmp);
	free(tmp);
	return 0;
}

int cmem_new(cmem c[], long length)
{
	for (int i = 0; i < length; i++)
	{
		c[i].key = NULL;
		c[i].val = NULL;
	}

	return 0;
}

int cmem_load(cmem c[], long length, fhandle fh)
{
	char *page = fh->content;
	int i = 0;

	for (char *p = strtok(page, "\n"); p != NULL; p = strtok(NULL, "\n"))
	{
		if (*p == 'D')
		{
			for (int i = 0; i < NDATES; i++)
			{
				if (dates[i] == NULL)
				{
					dates[i] = (date)malloc(sizeof(_date));
					dates[i]->rep = (p[1] == 'r' ? 1 : 0);
					dates[i]->day = p[2]-'0';
					dates[i]->name = strdup(p+3);
					break;
				}
			}
		}
		else if (strchr(p, '='))
		{
			c[i].key = strndup(p, strchr(p, '=')-p);
			c[i].val = strdup(strchr(p, '=')+1);
			i++;
		}
	}

	return 0;
}

char *cmem_query(cmem c[], long length, char *key)
{
	for (int i = 0; i < length; i++)
	{
		if (c[i].key && c[i].val)
		{
			if (strcmp(c[i].key, key) == 0)
				return c[i].val;
		}
	}

	return NULL;
}

int cmem_add(cmem c[], long length, char *key, char *val)
{
	for (int i = 0; i < length; i++)
	{
		if (c[i].key == NULL)
		{
			c[i].key = strdup(key);
			c[i].val = strdup(val);
			return 0;
		}
	}

	return 1;
}

int cmem_write(cmem c[], long length, fhandle fh)
{
	long newlen = 32 + NDATES*15;

	for (int i = 0; i < length; i++)
	{
		if (c[i].key)
			newlen += strlen(c[i].key)+3;
		if (c[i].val)
			newlen += strlen(c[i].val)+3;
	}

	char *tmp = (char *)malloc(newlen*sizeof(char));
	memset(tmp, 0, newlen*sizeof(char));

	for (int i = 0; i < length; i++)
	{
		if (c[i].key && c[i].val)
		{
			strcat(tmp, c[i].key);
			strcat(tmp, "=");
			strcat(tmp, c[i].val);
			strcat(tmp, "\n");
		}
	}

	for (int i = 0; i < NDATES; i++)
	{
		if (dates[i] && dates[i]->name)
		{
			strcat(tmp, "\nD");

			if (dates[i]->rep)
				strcat(tmp, "r");
			else
				strcat(tmp, "s");

			char a[2] = {dates[i]->day+'0', 0};
			strcat(tmp, a);
			strcat(tmp, dates[i]->name);
		}
	}

	fhandle_write(fh, tmp);
	fhandle_write(fh, "\n"); // flushes the last write

	return 0;
}

int ga_init()
{
	col_grey();

	printf("init ga files\n");
	ga_clan_fh = fhandle_new();
	ga_cmem_fh = fhandle_new();

	printf("openning files\n");
	fhandle_open(ga_clan_fh, "/etc/aitools/main.clan");
	fhandle_open(ga_cmem_fh, "/etc/aitools/main.cmem");

	printf("loading files\n");
	fhandle_load(ga_clan_fh);
	fhandle_load(ga_cmem_fh);

	printf("init ga\n");
	clan_new(ga_clan, NCLAN);
	cmem_new(ga_cmem, NCMEM);

	printf("loading ga\n");
	clan_load(ga_clan, NCLAN, ga_clan_fh);
	cmem_load(ga_cmem, NCMEM, ga_cmem_fh);

	col_default();

	return 0;
}

char *ga_strip(char *s)
{
	char *tmp = (char *)malloc(strlen(s)*sizeof(char));
	memset(tmp, 0, strlen(s)*sizeof(char));

	for (int i = 0; i < strlen(s); i++)
	{
		switch(s[i])
		{
			case '.':
			case ',':
			case '\"':
			case '\'':
			case '(':
			case ')':
			case '!':
			case '?':
				s[i] = ' ';
				break;
			case 'A': s[i] = 'a'; break;
			case 'B': s[i] = 'b'; break;
			case 'C': s[i] = 'c'; break;
			case 'D': s[i] = 'd'; break;
			case 'E': s[i] = 'e'; break;
			case 'F': s[i] = 'f'; break;
			case 'G': s[i] = 'g'; break;
			case 'H': s[i] = 'h'; break;
			case 'I': s[i] = 'i'; break;
			case 'J': s[i] = 'j'; break;
			case 'K': s[i] = 'k'; break;
			case 'L': s[i] = 'l'; break;
			case 'M': s[i] = 'm'; break;
			case 'N': s[i] = 'n'; break;
			case 'O': s[i] = 'o'; break;
			case 'P': s[i] = 'p'; break;
			case 'Q': s[i] = 'q'; break;
			case 'R': s[i] = 'r'; break;
			case 'S': s[i] = 's'; break;
			case 'T': s[i] = 't'; break;
			case 'U': s[i] = 'u'; break;
			case 'V': s[i] = 'v'; break;
			case 'W': s[i] = 'w'; break;
			case 'X': s[i] = 'x'; break;
			case 'Y': s[i] = 'y'; break;
			case 'Z': s[i] = 'z'; break;
			default:
				break;
		}
	}

	for (char *p = strtok(s, " "); p != NULL; p = strtok(NULL, " "))
	{
		if (strlen(p) == 0)
			continue;

		if (!clan_check_strip(ga_clan, NCLAN, p))
		{
			strcat(tmp, p);
			strcat(tmp, " ");
		}
	}

	return tmp;
}

char *ga_replace_sinonyms(char *s)
{
	char *tmp = (char *)malloc((strlen(s)+64)*sizeof(char));
	memset(tmp, 0, (strlen(s)+64)*sizeof(char));

	for (char *p = strtok(s, " "); p != NULL; p = strtok(NULL, " "))
	{
		char *sin = clan_get_sinonym(ga_clan, NCLAN, p);
		if (sin)
			strcat(tmp, sin);
		else
			strcat(tmp, p);
		strcat(tmp, " ");
	}

	return tmp;
}

char *ga_process(char *s)
{
	return ga_strip(strdup(ga_replace_sinonyms(strdup(s))));
}

int ga_compare(char *a, char *b)
{
	if (strcmp(ga_process(a), ga_process(b)) == 0)
		return 1;
	else return 0;
}

date date_new(char *when)
{
	date d = (date)malloc(sizeof(_date));

	char *p = strtok(strdup(when), " ");
	if (strcmp(p, "every") == 0)
		d->rep = 1;
	else
		d->rep = 0;

	p = strtok(NULL, " ");
	if (strstr(p, "day"))
	{
		if (strcmp(p, "monday") == 0)
			d->day = 0;
		else if (strcmp(p, "tuesday") == 0)
			d->day = 1;
		else if (strcmp(p, "wednesday") == 0)
			d->day = 2;
		else if (strcmp(p, "thursday") == 0)
			d->day = 3;
		else if (strcmp(p, "friday") == 0)
			d->day = 4;
		else if (strcmp(p, "saturday") == 0)
			d->day = 5;
		else if (strcmp(p, "sunday") == 0)
			d->day = 6;
		else
			d->day = -1;
	}

	d->name = strdup(strstr(when, "day ")+4);

	for (int i = 0; i < NDATES; i++)
		if (dates[i] == NULL)
		{
			dates[i] = d;
			break;
		}
	return d;
}

int date_check(date d)
{
	struct tm *sys_t;
	time_t tval;

	tval = time(NULL);
	sys_t = localtime(&tval);

	return sys_t->tm_wday - d->day - 1;
}

int dates_clean()
{
	for (int i = 0; i < NDATES; i++)
	{
		if (dates[i])
		{
			if (date_check(dates[i]) > 0 && dates[i]->rep == 0)
				dates[i] = NULL;
		}
	}

	return 0;
}

int pa_init()
{
	col_grey();

	printf("loading pa\n");

	col_default();
	return 0;
}

int pa_note_new(char *title)
{
	char *args = (char *)malloc(1024*sizeof(char));
	memset(args, 0, 1024*sizeof(char));

	strcat(args, "vim ");
	strcat(args, (char *)getenv("HOME"));
	strcat(args, DNOTES);
	strcat(args, title);
	strcat(args, ".note");

	system(args);

	return 0;
}

int pa_note_process(char *title)
{
	char *tmp;
	char *fname = (char *)malloc((strlen(title)+128)*sizeof(char));
	memset(fname, 0, (strlen(title)+128)*sizeof(char));
	char *page = (char *)malloc(4096*sizeof(char));
	memset(page, 0, 4096*sizeof(char));

	strcat(fname, (char *)getenv("HOME"));
	strcat(fname, DNOTES);
	strcat(fname, title);
	strcat(fname, ".note");

	fhandle n = fhandle_new();
	fhandle_open(n, fname);
	fhandle_load(n);

	for (char *p = strtok(fhandle_get(n), "\t"); p != NULL; p = strtok(NULL, "\t"))
	{
		tmp = strndup(p, (int)(strstr(p, ". ")-p));
		if (strstr(tmp, ".\n"))
			*(strstr(tmp, ".\n")) = 0;
		//tmp = ga_process(tmp);
		strcat(page, "-- ");
		strcat(page, tmp);
		strcat(page, "\n");
	}

	printf("%s\n", page);
	return 0;
}

int pa_note_query(char *title)
{
	/* pa_note_new simply creates a new note if a
	 * previous one of the same name doesn't exist. */
	return pa_note_new(title);
}

int pa_note_view(char *title)
{
	char *fname = (char *)malloc(1024*sizeof(char));

	strcat(fname, (char *)getenv("HOME"));
	strcat(fname, DNOTES);
	strcat(fname, title);
	strcat(fname, ".note");

	fhandle n = fhandle_new();
	fhandle_open(n, fname);
	fhandle_load(n);
	char *p = fhandle_get(n);
	if (strstr(p, "\n\n"))
		printf("%s", p);
	else
		printf("%s\n", p);

	return 0;
}

char *pa_rem_get()
{
	char *page = (char *)malloc(4096*sizeof(char));
	memset(page, 0, 4096*sizeof(char));

	for (int i = 0; i < NDATES; i++)
		if (dates[i] && dates[i]->name)
		{
			int r = date_check(dates[i]);
			if (r <= 0 && r >= -7)
			{
				switch(dates[i]->day)
				{
					case 0: strcat(page, "[Monday] ");
							break;
					case 1: strcat(page, "[Tuesday] ");
							break;
					case 2: strcat(page, "[Wednesday] ");
							break;
					case 3: strcat(page, "[Thursday] ");
							break;
					case 4: strcat(page, "[Friday] ");
							break;
					case 5: strcat(page, "[Saturday] ");
							break;
					case 6: strcat(page, "[Sunday] ");
							break;
					default: continue;
				}

				strcat(page, dates[i]->name);
				if (dates[i]->rep)
					strcat(page, " (repeating)");
				strcat(page, "\n");
			}
		}

	return page;
}
