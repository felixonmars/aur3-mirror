/* license: http://en.wikipedia.org/wiki/WTFPL */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <unistd.h>

int get_args(char** options, char** executable,
        int argc, char** argv) {
    int c;
    while ((c = getopt(argc, argv, "i:e:")) != -1) {
        switch (c) {
            case 'e':
                *executable = optarg;
                break;
            case 'i':
                *options = optarg;
                break;
            default:
                return 1;
        }
    }
    return 0;
}

void lowerize(char* line) {
    for (; *line != 0; ++line) {
        *line = tolower(*line);
    }
}

int is_one_of(const char* argument, const char* options) {
    int rv = 0;
    char* options_bak = strdup(options);
    char* argument_bak = strdup(argument);
    char* state = 0;
    char* token;

    lowerize(argument_bak);

    token = strtok_r(options_bak, ":", &state);
    while (rv == 0 && token != 0) {
        if (strcmp(token, argument_bak) == 0) {
            rv = 1;
        }
        token = strtok_r(0, ":", &state);
    }

    free(argument_bak);
    free(options_bak);
    return rv;
}

char* must_be_converted(const char* argument, const char* options) {
    char* first_slash;
    if ((first_slash = strchr(argument, '/')) && !is_one_of(argument, options)) {
        return first_slash;
    }
    else {
        return 0;
    }
}

void convert_slashes(char* line) {
    for (; *line != 0; ++line) {
        if (*line == '/') {
            *line = '\\';
        }
    }
}

char* make_full_path(const char* relative_name) {
    char* full_path;
    size_t rnl = strlen(relative_name);

    rnl += 128;

    full_path = malloc(rnl);
    strcpy(full_path, "z:");

    while (0 == getcwd(full_path + 2, rnl - 2)) {
        rnl *= 2;
        full_path = realloc(full_path, rnl);
    }

    strcat(full_path, "/");
    strcat(full_path, relative_name);

    return full_path;
}

void convert_arg(char** argument, const char* options) {
    char* first_slash;
    if ((first_slash = must_be_converted(*argument, options))) {
        char* new_argument;
        if (first_slash == *argument) {
            /* full path, we need to add z: */
            size_t len = strlen(*argument);
            len += 3;
            new_argument = malloc(len);
            strcpy(new_argument, "z:");
            strcat(new_argument, *argument);
            convert_slashes(new_argument);
        }
        else {
            /* relative path, we need just to change the slashes */
            new_argument = make_full_path(*argument);
            convert_slashes(new_argument);
        }
        *argument = new_argument;
    }
}

void convert(char** arguments, char* options) {
    if (options != 0) {
        lowerize(options);
        for (;*arguments != 0; ++arguments) {
            convert_arg(arguments, options);
        }
    }
}

int explain(char* program_name) {
    fprintf(stderr, "Usage: %s -e prg [-i ignore_options ] -- arguments\n\n",
            program_name);
    fprintf(stderr, "Starts wine converting filenames from Linux to Wine format.\n"
        " prg is what wine will execute.\n"
        " ignore_options is a `:' separed list of strings we must not touch\n"
        "  (usually arguments with /).\n"
        " arguments is what we pass to the application. Filenames will be converted.\n"
        " %s converts every argument contains a / and it is not in the"
        " ignore_options list.\n\n", program_name);
    fprintf(stderr, " e.g.:\n"
        "  %s -e utorrent.exe -i '/directory:/hide' -- \\\n"
        "  /directory /home/jack/rob /home/jack/rob.torrent'\n"
        " will start:\n"
        "  wine utorrent.exe /directory z:\\home\\jack\\rob \\\n"
        "  z:\\home\\jack\\rob.torrent\n\n", program_name);
    return 1;
}

int main(int argc, char** argv) {
    int split = 1;
    char* options = 0;
    char* executable = 0;

    while (split < argc && strcmp(argv[split], "--") != 0) {
        ++split;
    }
    if (split == argc) {
        return explain(argv[0]);
    }

    argv[split] = 0;
    if (get_args(&options, &executable, split, argv) != 0
            || executable == 0) {
        return explain(argv[0]);
    }

    argv[split] = executable;
    --split;
    argv[split] = "wine";
    argv += split;

    convert(argv + 2, options);

#ifndef NDEBUG
    {
        char** check = argv;
        fprintf(stderr, "Executing: \n-- begin\n");
        for (; *check != 0; ++check) {
            fprintf(stderr, "%s\n", *check);
        }
        fprintf(stderr, "-- end\n");
    }
#else
    execvp(argv[0], argv);
    fprintf(stderr, "execvp() failed!\n");
#endif

    return 2;
}

