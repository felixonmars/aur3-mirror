#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define BUFFER_SIZE 1024

typedef unsigned char byte;

typedef struct {
    byte type;
    byte length;
    byte *value;
} TLV;

typedef enum {
    MODE_TEXT,
    MODE_BIN,
    MODE_TLV
} MODE;

char *to_hex_string(byte bytes[], int len) {
    int i;
    char *out = malloc((len * 2) + 1);

    for(i=0; i<len; i++) {
        sprintf(out + (i * 2), "%02x", bytes[i]);
    }

    return out;
}

void from_hex_string(char* string, byte **bytes, int *len) {
    int i;

    *len = strlen(string) / 2;
    *bytes = malloc(*len);

    for(i=0; i<*len; i++) {
        sscanf(string + (i * 2), "%2hhx", *bytes + i);
    }
}

/*
 * Return false if bytes does not represent a valid tlv
 */
bool parse_tlv(byte bytes[], int len, TLV *tlv, bool exact) {
    int i;

    if(len < 2) {
        return false;
    }

    tlv->type = bytes[0];
    tlv->length = bytes[1];

    if(exact && len -2 != tlv->length) {
        return false;
    }

    if(len - 2 < tlv->length) {
        return false;
    }

    tlv->value = malloc(tlv->length);

    memcpy(tlv->value, &bytes[2], tlv->length);

    return true;
}

void print_tlv(TLV tlv, char *indent) {
    TLV child;
    char *child_indent;

    printf("%sType: %02x\n", indent, tlv.type);
    printf("%sLength: %d\n", indent, tlv.length);

    if(parse_tlv(tlv.value, tlv.length, &child, true)) {
        printf("%sValue: [\n", indent);

        child_indent = calloc(strlen(indent) + 3, 1);

        strcat(child_indent, indent);
        strcat(child_indent, "  ");

        print_tlv(child, child_indent);

        printf("%s]\n", indent);
    } else {
        printf("%sValue: %s\n", indent, to_hex_string(tlv.value, tlv.length));
    }
}

void printhelp(char* name) {
    printf("Usage: %s OPTIONS*\n", name);
    printf("\n");
    printf("  -c  Convert hex string into characters\n");
    printf("  -h  Convert characters into a hex string\n");
    printf("  -t  Parse as TLV\n");
    printf("\n");
    printf("The options can be chained in any order, e.g.:\n");
    printf("  $ echo Hello | %s -h -c\n", name);
    printf("  Hello\n");
    printf("i.e. Hello was converted to hex and back again\n");
    printf("\n");
}

int main(int argc, char *argv[]) {
    byte *bytes = calloc(BUFFER_SIZE, 1);
    byte *buffer = calloc(BUFFER_SIZE, 1);
    int bytes_len, buffer_len, i;
    MODE mode = MODE_TEXT;
    TLV tlv;

    if(argc < 2) {
        printhelp(argv[0]);
        return 1;
    }

    // Read input both as a string and as a byte array - just in case
    bytes_len = fread(bytes, 1, BUFFER_SIZE, stdin);

    for(i=1; i<argc; i++) {
        if(strcmp(argv[i], "-c") == 0) {
            mode = MODE_BIN;

            from_hex_string(bytes, &buffer, &bytes_len);

            strcpy(bytes, buffer);
        } else if(strcmp(argv[i], "-h") == 0) {
            mode = MODE_TEXT;

            bytes = to_hex_string(bytes, bytes_len);

            bytes_len = strlen(bytes);
        } else if(strcmp(argv[i], "-t") == 0) {
            mode = MODE_TLV;

            if(!parse_tlv(bytes, bytes_len, &tlv, true)) {
                printf("No valid TLV sequence found\n");
                return 1;
            }
        } else {
            printhelp(argv[0]);
            return 1;
        }
    }

    // Print the result
    if(mode == MODE_TEXT) {
        printf("%s", bytes);
    } else if(mode == MODE_BIN) {
        for(i=0; i<bytes_len; i++) {
            printf("%c", bytes[i]);
        }
    } else if(mode == MODE_TLV) {
        print_tlv(tlv, "");
    }
}
