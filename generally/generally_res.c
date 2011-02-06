#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char** argv) {
    char* home;
    char* options_file;
    FILE* options;
    int res;
    int rv = 0;
    if (argc != 2) {
        fprintf(stderr, "Usage: %s int\n"
        "Where int represent the wanted resolution:\n"
        "1 -  320x240\n"
        "2 -  512x384\n"
        "3 -  640x480\n"
        "4 -  800x600\n"
        "5 - 1024x768\n"
        "6 - 1152x864\n"
        "7 - 1280x960\n"
        "8 - 1600x1200\n"
        "This program does not check if the resolution is allowed by your X "
        "server.\n", argv[0]);
        return 0;
    }
    res = atoi(argv[1]);
    if (res < 1 || res > 8) {
        fprintf(stderr, "Invalid value.\n");
        return 1;
    }
    --res; /* Generally uses values from 0 to 7. */
    home = getenv("HOME");
    options_file = (char*) malloc(strlen(home) + 24);
        /* home path + '/.generally/Options.set\0' */
    if (options_file == NULL) {
        fprintf(stderr, "Malloc failed.\n");
        return 1;
    }
    strcpy(options_file, home);
    strcat(options_file, "/.generally/Options.set");
    options = fopen(options_file, "r+");
    if (options == NULL) {
        fprintf(stderr, "Can't open your options file: %s\n"
            "execute generally once.\n", options_file);
        rv = 2;
    }else {
        fseek(options, 0x13, SEEK_SET);
        /* The 0x13th byte is where is setted the resolution. */
        fputc(res, options);
        fclose(options);
    }
    free(options_file);
    return rv;
}

