/*******************************************************************************
Copyright (c) 2007 Mildred <silkensedai@online.fr>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*******************************************************************************/

#include <libmpdclient.h>

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define _XOPEN_SOURCE 500
#include <unistd.h>
#include <signal.h>

static int cont;
static int pausemode;

void signal_quit(int signal){
    cont = 0;
    printf("quit\n");
}

void signal_setpause(int signal){
    pausemode = 1;
    printf("set pause on %i\n", pausemode);
}

void signal_unsetpause(int signal){
    pausemode = 0;
    printf("set pause off %i\n", pausemode);
}

void signal_togglepause(int signal){
    pausemode = !pausemode;
    printf("set pause toggle %i\n", pausemode);
}

#define is_end_of_song(elapsed_time,total_time) ((elapsed_time)+2>(total_time))
#define SLEEP_STEP 100

int main(int argc, char **argv) {
    mpd_Connection *cnx;

    char* hostname = getenv("MPD_HOST");
    char* port     = getenv("MPD_PORT");
    if(!hostname) hostname = "localhost";
    if(!port)     port = "6600";

    sigset(SIGINT,  signal_quit);
    sigset(SIGQUIT, signal_quit);
    sigset(SIGUSR1, signal_setpause);
    sigset(SIGUSR2, signal_unsetpause);
    sigset(SIGHUP,  signal_togglepause);

    cnx = mpd_newConnection(hostname, atoi(port), 10);

    if(cnx->error) {
        fprintf(stderr, "connexion error: %s\n", cnx->errorStr);
        mpd_closeConnection(cnx);
        return 1;
    }

    char* current_song = NULL;
    int current_mode = MPD_STATUS_STATE_PLAY;
    int elapsed_time = 0;
    int total_time = 0;

    cont = 1;
    pausemode = (argc >= 2) ? atoi(argv[1]) : 1;

    int i = 0;
    while(cont){

        //printf("current song[1]: %s\n", current_song ? current_song : "NULL");

        mpd_Status* status = NULL;
        mpd_InfoEntity* entity = NULL;

        //mpd_sendCommandListOkBegin(cnx);
        //mpd_sendStatusCommand(cnx);
        //mpd_sendCurrentSongCommand(cnx);
        //mpd_sendCommandListEnd(cnx);

        mpd_sendStatusCommand(cnx);
        mpd_nextListOkCommand(cnx);

        if(!(status = mpd_getStatus(cnx))) {
            fprintf(stderr, "status error: %s\n", cnx->errorStr);
            mpd_closeConnection(cnx);
            return 1;
        }

        mpd_sendCurrentSongCommand(cnx);
        mpd_nextListOkCommand(cnx);

        int do_pause = 0;

        while((entity = mpd_getNextInfoEntity(cnx))){

            if(entity->type != MPD_INFO_ENTITY_TYPE_SONG){
                mpd_freeInfoEntity(entity);
                continue;
            }

            const char* new_song = entity->info.song->file;
            //printf("current song: %s\n", new_song ? new_song : "NULL");

            if(!new_song){
                if(current_song) free(current_song);
                current_song = NULL;
            }else if(!current_song || strcmp(current_song, new_song)){
                printf("new song: %s\n", new_song ? new_song : "NULL");
                do_pause =
                    pausemode &&
                    current_song &&
                    current_mode == MPD_STATUS_STATE_PLAY &&
                    is_end_of_song(elapsed_time, total_time);
                printf("song: %i/%i (end of song: %i)\n",
                    elapsed_time, total_time, do_pause);
                size_t len = strlen(new_song);
                if(current_song) free(current_song);
                current_song = malloc(len+1);
                memcpy(current_song, new_song, len+1);
            }

            mpd_freeInfoEntity(entity);

        }

        current_mode = status->state;
        elapsed_time = status->elapsedTime;
        total_time   = status->totalTime;

        if(cnx->error) {
            fprintf(stderr, "error: %s\n", cnx->errorStr);
            mpd_closeConnection(cnx);
            return 255;
        }

        if(do_pause){
            printf("pause\n");
            mpd_sendPauseCommand(cnx, 1);
            if(cnx->error) {
                fprintf(stderr, "pause error: %s\n", cnx->errorStr);
                mpd_closeConnection(cnx);
                return 255;
            }
        }

        mpd_finishCommand(cnx);

        if(cnx->error) {
            fprintf(stderr, "finnish command error: %s\n", cnx->errorStr);
            mpd_closeConnection(cnx);
            return 255;
        }

        mpd_freeStatus(status);

        usleep(SLEEP_STEP);

    }

    if(current_song) free(current_song);

    mpd_closeConnection(cnx);
    return 0;
}


/* kate: indent-width 4; space-indent on; replace-tabs off;
 * kate: replace-tabs-save off; tab-width 8; remove-trailing-space on; */
