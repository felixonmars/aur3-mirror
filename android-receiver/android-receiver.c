#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <unistd.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <getopt.h>
#include <errno.h>

#define MAXBUF 1024
#define SEP    "/"

#define STREQ(a, b)  strcmp((a),(b)) == 0
#define STRDUP(a, b) if ((b)) a = strdup((b))

static int portno = 10600;

enum etype {
    Ring,
    SMS,
    MMS,
    Battery,
    Ping,
    Unknown
};

struct message_t {
    int         version;
    char *      device_id;
    char *      notification_id;
    enum etype  event_type;
    char *      data;
    char *      event_contents;
};

static void parse_options(int argc, char *argv[]) {
    int opt, option_index = 0;
    char *token;

    static struct option opts[] = {
        { "port"   , required_argument, 0, 'p'},
        { "help"   , no_argument,       0, 'h'},
        { 0        , 0                , 0, 0  }
    };

    while ((opt = getopt_long(argc, argv, "hp:", opts, &option_index)) != -1) {
        switch (opt) {
            case 'p':
                portno = strtol(optarg, &token, 10);
                if (*token != '\0' || portno <= 0 || portno > 65535) {
                    fprintf(stderr, "invalid port number\n");
                    exit(EXIT_FAILURE);
                }
                break;

            case 'h':
                printf("usage: android-receiver [ -p <port> ]\n");
                exit(EXIT_SUCCESS);

            default:
                fprintf(stderr, "invalid option, try -h or --help\n");
                exit(EXIT_FAILURE);
        }
    }
}

static struct message_t *parse_message(char *msg) {
    struct message_t *message;
    char *tmp, *tok;
    int field = 0;

    message = malloc(sizeof *message);

    /* v1:        device_id / notification_id / event_type /        event_contents */
    /* v2: "v2" / device_id / notification_id / event_type / data / event_contents */
    for (tok = strsep(&msg, SEP); ++field <= 5; tok = strsep(&msg, SEP)) {
        switch (field) {
            case 1:
                if (tok && STREQ(tok, "v2"))
                    message->version = 2;
                else {
                    /* rebuild a v1 msg to start parsing at field 2 */
                    message->version = 1;
                    tmp = strdup(msg);
                    strcat(tok, SEP);
                    strcat(tok, tmp);
                    msg = tok;
                }
                break;

            case 2: STRDUP(message->device_id, tok);       break;
            case 3: STRDUP(message->notification_id, tok); break;

            case 4:
                if      (STREQ(tok, "RING"))    message->event_type = Ring;
                else if (STREQ(tok, "SMS"))     message->event_type = SMS;
                else if (STREQ(tok, "MMS"))     message->event_type = MMS;
                else if (STREQ(tok, "BATTERY")) message->event_type = Battery;
                else if (STREQ(tok, "PING"))    message->event_type = Ping;
                else                            message->event_type = Unknown;

                if (message->version == 1) {
                    /* for v1, grab everything else and return */
                    STRDUP(message->event_contents, msg);
                    message->data = "";
                    return message;
                }
                break;

            case 5:
                STRDUP(message->data, tok);
                STRDUP(message->event_contents, msg);
                return message;
        }
    }

    return message;
}

static void handle_message(char *msg) { /* {{{ */
    printf("message received: %s\n", msg);

    struct message_t *message;
    char *title, *body;

    message = parse_message(msg);

    switch (message->event_type) {
        case Ring:
            asprintf(&title, "Call: %s", message->data);
            break;
        case SMS:
            asprintf(&title, "SMS: %s", message->data);
            break;
        case MMS:
            asprintf(&title, "MMS: %s", message->data);
            break;
        case Battery:
            asprintf(&title, "Battery: %s", message->data);
            break;
        case Ping:
            title = "Ping";
            break;

        default:
            return;
    }

    asprintf(&body, "%s", message->event_contents);

    char *flags[] = { "notify-send", title, body, (char *)NULL };

    /* double-fork taken from dzen2/util.c; avoids zombie processes
     * without requiring a signal handler. */
    if (fork() == 0) {
        if (fork() == 0) {
            execvp("notify-send", flags);
            exit(EXIT_SUCCESS);
        }
        exit(EXIT_SUCCESS);
    }

    wait(0);
}

int main(int argc, char *argv[]) {
    char buf[MAXBUF];

    struct sockaddr_in server, from;

    int          sock, n;
    unsigned int fromlen = sizeof from;

    parse_options(argc, argv);

    if ((sock = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
        perror("error opening socket");
        exit(EXIT_FAILURE);
    }

    memset(&server, '\0', sizeof server);

    server.sin_family      = AF_INET;
    server.sin_port        = htons(portno);
    server.sin_addr.s_addr = INADDR_ANY;

    if (bind(sock, (struct sockaddr *)&server, sizeof server) < 0) {
        perror("error binding to socket");
        exit(EXIT_FAILURE);
    }

    while (1) {
        while ((n = recvfrom(sock, buf, 1024, 0, (struct sockaddr *)&from, &fromlen)) < 0 && errno == EINTR)
            ;

        if (n < 0) {
            perror("error receiving from socket");
            exit(EXIT_FAILURE);
        }

        handle_message(buf);
    }
}
