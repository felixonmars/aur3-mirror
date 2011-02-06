/*
 * dmenu_path
 * This program dumps all executables in $PATH to stdout.
 * It uses the file $HOME/.dmenu_cache as a cache.
 *
 * This program is released under the X11 license (sometimes known as the MIT
 * license), which basically means that you can do whatever you want with it.
 *
 * Sorry for the hairy code. I didn't know how to make it simpler and still
 * as generic. Valgrind claims it's correct and doesn't leak, but I'm sure you
 * can find a couple of ways to make it crash.
 *
 * I'd appreciate, but I don't require, that you mail me any improvements or
 * comments on the code.
 *
 * Elmo Todurov todurov+dmenu@gmail.com
 * 2010-05-19 09:55
 */

#include <sys/stat.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <malloc.h>
#include <unistd.h>
#include <dirent.h>
#include <assert.h>

static uid_t uid;
static gid_t gid;
static char* cache_path;

static int uptodate(char** paths)
{
    struct stat dirstat;
    time_t cache_time;
    char** dirs;

    if (stat(cache_path, &dirstat))
    {
	if (errno != ENOENT)
	{
	    perror("stat");
	}
	return 0;
    }
    cache_time = dirstat.st_mtime;

    dirs = paths;
    while (*dirs != NULL)
    {
	if (stat(*dirs, &dirstat))
	{
	    if (errno != ENOENT)
		perror("stat");
	    return 0;
	}

	if (cache_time < dirstat.st_mtime)
	    return 0;

	dirs++;
    }

    return 1;
}

static void die(const char* msg)
{
    perror(msg);
    exit(EXIT_FAILURE);
}

static char* get_cache_path()
{
    const char* home;
    char* path;
    home = getenv("HOME");
    if (home == NULL)
	die("getenv");
    path = (char*)malloc(strlen(home) + strlen("/.dmenu_cache") + 1);
    if (path == NULL)
	die("malloc");
    strcpy(path, home);
    strcat(path, "/.dmenu_cache");
    return path;
}

static char* get_PATH()
{
    const char* path = getenv("PATH");
    char* copy_path;
    if (path == NULL)
	die("getenv");

    copy_path = strdup(path);
    return copy_path;
}

static void split_PATH(char* PATH, char*** dirs_in)
{
    char** dirs;
    const char* dir = strtok(PATH, ":");
    size_t i = 0;
    size_t allocated = 10;
    dirs = (char**)malloc(sizeof(char*) * allocated);
    if (dirs == NULL)
	die("malloc");

    while (dir != NULL)
    {
	dirs[i] = (char*)malloc(strlen(dir) + 1);
	if (dirs[i] == NULL)
	    die("malloc");
	strcpy(dirs[i], dir);
	dir = strtok(NULL, ":");
	i++;
	if (i == allocated)
	{
	    allocated *= 2;
	    dirs = (char**)realloc(dirs, allocated * sizeof(char**));
	    if (dirs == NULL)
		die("realloc");
	}
    }
    dirs[i] = NULL;

    *dirs_in = dirs;
}

static void free_charpp(char** in)
{
    char** ptr = in;
    while (*ptr != NULL)
    {
	free(*ptr);
	ptr++;
    }
    free(in);
}

static void fprint_charpp(char** in, FILE* out)
{
    char** ptr = in;
    while (*ptr != NULL)
    {
	fputs(*ptr, out);
	fputc('\n', out);
	ptr++;
    }
}

static size_t count_charpp(char** in)
{
    char** ptr = in;
    size_t count = 0;
    while (*ptr != NULL)
    {
	count++;
	ptr++;
    }
    return count;
}

static int isexecutable(const char* fname)
{
    struct stat st;
    int ret;
    int success;
    gid_t* grouplist;

    ret = stat(fname, &st);
    if (ret != 0)
	return 0;
    if (!S_ISREG(st.st_mode)) /* this catches regular files and symlinks as well */
	return 0;
    if ((st.st_uid == uid && (st.st_mode & S_IXUSR) != 0)
	    || (st.st_uid != uid && st.st_gid != gid && (st.st_mode & S_IXOTH) != 0))
    {
	return 1;
    }

    /* check secondary groups */
    if (st.st_mode & S_IXGRP)
    {
	success = 0;
	ret = getgroups(0, 0);
	grouplist = (gid_t*)malloc(sizeof(gid_t) * ret);
	if (grouplist == NULL)
	    die("malloc");
	ret = getgroups(ret, grouplist);
	while (ret != 0)
	{
	    ret--;
	    if (st.st_uid != uid /* for group to match, user must not match. */
		    && st.st_gid == grouplist[ret])
	    {
		success = 1;
		break;
	    }
	}
	free(grouplist);
	return success;
    }

    return 0;
}

static void add(const char* prog, char*** progs)
{
    static unsigned progs_allocated = 0;
    static unsigned progs_used = 0;

    if (progs_used == progs_allocated)
    {
	progs_allocated = progs_allocated == 0 ? 256 : progs_allocated * 2;
	*progs = (char**)realloc(*progs, sizeof(char*) * progs_allocated);
	if (*progs == NULL)
	    die("realloc");
    }

    if (prog != NULL)
    {
	(*progs)[progs_used] = (char*)malloc(strlen(prog) + 1);
	if ((*progs)[progs_used] == NULL)
	    die("malloc");
	strcpy((*progs)[progs_used], prog);
	progs_used++;
    }
    else
    {
	(*progs)[progs_used] = NULL;
    }
}

static void refresh_path(const char* path, char*** progs)
{
    DIR* dirp = opendir(path);
    struct dirent* dp;
    char fullpath[PATH_MAX];
    char* end;
    strcpy(fullpath, path);
    end = fullpath + strlen(fullpath);

    if (dirp == NULL)
    {
	if (errno != ENOENT)
	    perror("opendir");
	return;
    }

    dp = readdir(dirp);
    while (dp != NULL)
    {
	strcat(end, "/");
	strcpy(end + 1, dp->d_name);
	if (isexecutable(fullpath))
	    add(dp->d_name, progs);
	dp = readdir(dirp);
    }
    closedir(dirp);
}

static int compare(const void* a, const void* b)
{
    return strcmp(*(const char**)a, *(const char**)b);
}

static void sort(char*** progs)
{
    qsort(*progs, count_charpp(*progs), sizeof(*progs), compare);
}

static void uniq(char*** progs)
{
    char** progs_new;
    char** ptr_1 = *progs;
    char** ptr_2 = ptr_1 + 1;
    unsigned long i = 0;;

    progs_new = (char**)malloc(sizeof(char*) * (count_charpp(*progs) + 1));
    if (progs_new == NULL)
	die("malloc");

    while (*ptr_1 != NULL)
    {
	while (*ptr_2 != NULL && strcmp(*ptr_1, *ptr_2) == 0)
	{
	    free(*ptr_2);
	    ptr_2++;
	}
	progs_new[i] = *ptr_1;
	i++;
	ptr_1 = ptr_2;
	ptr_2++;
    }
    progs_new[i] = NULL;

    free(*progs);

    *progs = progs_new;
}

static void refresh(char** paths)
{
    char** progs = NULL;
    FILE* out;
    while (*paths != NULL)
    {
	refresh_path(*paths, &progs);
	paths++;
    }
    add(NULL, &progs);

    out = fopen(cache_path, "w");
    if (out == NULL)
	die("fopen");

    sort(&progs);
    uniq(&progs);
    fprint_charpp(progs, out);
    fprint_charpp(progs, stdout);

    free_charpp(progs);
    fclose(out);
}

static void cat()
{
    FILE* cache = fopen(cache_path, "r");
    char buf[4096];
    struct stat cachestat;
    size_t still_unread;
    size_t chunk;
    if (cache == NULL)
	die("fopen");

    if (stat(cache_path, &cachestat))
	die("stat");
    still_unread = cachestat.st_size;

    while (still_unread > 0)
    {
	chunk = fread(buf, 1, sizeof(buf), cache);
	still_unread -= chunk;
	fwrite(buf, 1, chunk, stdout);
    }
    fclose(cache);
}

int main(int argc, char *argv[])
{
    char* PATH;
    char** paths = NULL;
    PATH = get_PATH();
    uid = getuid();
    gid = getgid();

    cache_path = get_cache_path();
    split_PATH(PATH, &paths);
    free(PATH);
    sort(&paths);
    uniq(&paths);

    if ((argc == 2 && strcmp(argv[1], "-f") == 0)
	    || !uptodate(paths))
	refresh(paths);
    else
	cat();

    free_charpp(paths);
    free(cache_path);

    return 0;
}
