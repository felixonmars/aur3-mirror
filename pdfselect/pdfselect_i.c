#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void add_pages(char* buffer, int sr, int er, int npages) {
    int i;
    for (i = sr; i <= er && i < npages && i > 0; ++i) {
        buffer[i] = 0;
    }
}

void add_page(char* buffer, int sr, int npages) {
    if (sr > 0 && sr < npages) {
        buffer[sr] = 0;
    }
}

void apply_range(char* buffer, int npages, const char* range) {
    if (range != NULL) {
        int sr;
        int er;
        const char* t;
        enum {
            brange = 1,
            erange = 2,
            end = 4,
            none = 8
        } state;
        state = brange;
        memset(buffer, 1, npages); /* no pages. */
        t = range;
        while ((state & end) == 0) {
            switch (*range) {
                case '0': case '1': case '2': case '3': case '4':
                case '5': case '6': case '7': case '8': case '9':
                    ++range;  /* case [:digit:] */
                    break;
                case '-':
                    ++range;
                    if ((state & brange) != 0) {
                        sscanf(t, "%d-", &sr);
                        state &= ~brange;
                        state |= erange;
                    }
                    t = range;
                    break;
                case '\0':
                    state |= end;
                    --range; /* no break */
                case ',':
                    ++range;
                    if ((state & brange) != 0) {
                        sscanf(t, "%d,", &sr);
                        add_page(buffer, sr, npages);
                    } else if ((state & erange) != 0) {
                        state &= ~erange;
                        state |= brange;
                        sscanf(t, "%d-", &er);
                        add_pages(buffer, sr, er, npages);
                    }
                    t = range;
                    break;
                default:
                    t = range;
                    ++range;
            }
        }
    }
}

int main(int argc, char** argv) {
    int i;
    int npages;
    char r = 0;
    char e = 0;
    char o = 0;
    char* range = NULL;

    if (argc == 1) {
        fprintf(stderr, "%s nofpages [e | o] [r] [range]\n", argv[0]);
        return -1;
    }

    sscanf(argv[1], "%d", &npages);
    if (npages <= 0) {
        fprintf(stderr, "Number of pages invalid.\n");
        return -1;
    }

    for (i = 2; i < argc; ++i) {
        if (strcmp(argv[i], "r") == 0) {
            r = 1;
        } else if (strcmp(argv[i], "e") == 0) {
            e = 1;
        } else if (strcmp(argv[i], "o") == 0) {
            o = 1;
        } else {
            range = argv[i];
        }
    }
    if (e == 1 && o == 1) {
        e = 0;
        o = 0;
    }

    ++npages;
    {
        /* if buffer[i] is zero, i is in the range. */
        char* buffer = calloc(1, npages);
        if (buffer == NULL) {
            fprintf(stderr, "Sorry, internal error.\n");
            return -1;
        }
        apply_range(buffer, npages, range);
        if (e == 1) {
            for (i = 1; i < npages; i += 2) {
                buffer[i] = 1;
            }
        }
        if (o == 1) {
            for (i = 2; i < npages; i += 2) {
                buffer[i] = 1;
            }
        }
        buffer[0] = 1; /* page zero does not exist. */
        if (r == 0) {
            for (i = 0; i < npages; ++i) {
                if (buffer[i] == 0) printf("%d ", i);
            }
        }else {
            for (i=npages; i > 0; ) {
                --i;
                if (buffer[i] == 0) printf("%d ", i);
            }
        }
        free(buffer);
    }
    return 0;
}

