/* syncdir -- emulate synchronous directories
    Copyright (C) 1998 Bruce Guenter

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

    You can reach me at bruce.guenter@qcc.sk.ca
*/

#include <sys/types.h>
#include <sys/stat.h>
#define open XXX_open
#include <fcntl.h>
#undef open
#include <unistd.h>
#include <string.h>
#include <syscall.h>
#include <stdio.h>
#include <errno.h>
#include <bits/syscall.h>

#define SYS_OPEN(FILE,FLAG,MODE) syscall(SYS_open, FILE, FLAG, MODE)
#define SYS_CLOSE(FD) syscall(SYS_close, FD)
#define SYS_LINK(OLD,NEW) syscall(SYS_link, OLD, NEW)
#define SYS_UNLINK(PATH) syscall(SYS_unlink, PATH)
#define SYS_RENAME(OLD,NEW) syscall(SYS_rename, OLD, NEW)
#define SYS_FSYNC(FD) syscall(SYS_fsync, FD)

static int fdirsync(const char* filename, unsigned length)
{
  char dirname[length+1];
  /* This could also be:
   * char* dirname = alloca(length+1); */
  int dirfd;
  int retval;
  memcpy(dirname, filename, length);
  dirname[length] = 0;
  if((dirfd = SYS_OPEN(dirname,O_RDONLY,0)) == -1)
    return -1;
  retval = (SYS_FSYNC(dirfd) == -1 && errno == EIO) ? -1 : 0;
  SYS_CLOSE(dirfd);
  return retval;
}

static int fdirsyncfn(const char *filename)
{
   const char *slash = filename+strlen(filename)-1;

   /* Skip over trailing slashes, which would be ignored by some
    * operations */
   while(slash > filename && *slash == '/')
     --slash;

   /* Skip back to the next slash */
   while(slash > filename && *slash != '/')
     --slash;

   /* slash now either points to a '/' character, or no slash was found */
   if(*slash == '/')
      return fdirsync(filename,
                      (slash == filename) ? 1 : slash-filename);
   else
     return fdirsync(".", 1);
}

int open(const char *file,int oflag,mode_t mode)
{
  int fd = SYS_OPEN(file, oflag, mode);
  if(fd == -1)
    return fd;
  if (oflag & O_CREAT)
    if (fdirsyncfn(file) == -1) {
      SYS_CLOSE(fd);
      return -1;
    }
  return fd;
}

int link(const char *oldpath,const char *newpath)
{
   if(SYS_LINK(oldpath,newpath) == -1)
     return -1;
   return fdirsyncfn(newpath);
}

int unlink(const char *path)
{
   if(SYS_UNLINK(path) == -1)
     return -1;
   return fdirsyncfn(path);
}

int rename(const char *oldpath,const char *newpath)
{
   if (SYS_RENAME(oldpath,newpath) == -1)
     return -1;
   if (fdirsyncfn(newpath) == -1)
     return -1;
   return fdirsyncfn(oldpath);
}
