
// gcc -fPIC -shared -Wl,-soname,totally-ubuntu.so -o totally_ubuntu.so totally_ubuntu.c

#define _GNU_SOURCE
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dlfcn.h>

typedef FILE *(*fopen_t)(const char *path, const char *mode);

FILE *fopen(const char *path, const char *mode) {
  fopen_t real_fopen = (fopen_t)dlsym(RTLD_NEXT, "fopen");
  if (strcmp(path, "/etc/lsb-release") == 0) {
    printf("[totally_ubuntu.so] Overriding open(): /etc/lsb-release -> /opt/vidyo/VidyoDesktop/ubuntu-lsb-release\n");
    return (*real_fopen)("/opt/vidyo/VidyoDesktop/ubuntu-lsb-release", mode);
  }
  return (*real_fopen)(path, mode);
}
