/**********************************************************
		MPD-NOTIFY
# By Msdark (msdark@archilinux.us)
#
# Copyright (C) 2008 Matías Hernández
#
#
# Licensed under the GNU General Public License Version 3
# Ver LICENSE
**********************************************************/

#include "libmpdclient.h"
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

mpd_Connection * conn;
int reconectar(char *hostname,char *port){
	printf("Desconectando....\n");
	mpd_closeConnection(conn);
	conn = 0;
	printf("Reconectando...\n");
	sleep(15);
	conn = mpd_newConnection(hostname,atoi(port),10);
	if(conn->error){
		mpd_closeConnection(conn);
		return -1;
	}
	printf("Conectado a MPD\n");
	return 0;
}

int conectar(char *hostname,char *port){
	conn = 0;
	conn = mpd_newConnection(hostname,atoi(port),10);
	if(conn->error){
		mpd_closeConnection(conn);
		return -1;
	}
	return 0;
}

int main(){
	char *hostname,*port;
	char info[500]="NULL",notify[41]="/usr/bin/notify-send -t 2000 -u normal ";
	char instruccion[1000];
	hostname = getenv("MPD_HOST");
	port = getenv("MPD_PORT");
	int elapsed;
	int last_id = -1;
	mpd_Status *status;
	conectar(hostname,port);
	while(1){
		 mpd_sendCommandListOkBegin(conn);
		 mpd_sendStatusCommand(conn);
	         mpd_sendCurrentSongCommand(conn);
        	 mpd_sendCommandListEnd(conn);
	
		if((status = mpd_getStatus(conn))==NULL){
			mpd_finishCommand(conn);
			reconectar(hostname,port);
			printf("\tMPD Stopped\n");
			continue;
		}
		if(status->state==MPD_STATUS_STATE_PAUSE){
			printf("Esta pausado\n");
			continue;
		}else{
			if(status->state!=MPD_STATUS_STATE_PLAY){
				printf("Esta detenido\n");
				continue;
			}
		}
		mpd_freeStatus(status);
		mpd_nextListOkCommand(conn);
		mpd_InfoEntity *entity;
		entity = mpd_getNextInfoEntity(conn);
		mpd_Song *song = entity->info.song;
		if(entity->type!=MPD_INFO_ENTITY_TYPE_SONG){
			mpd_freeInfoEntity(entity);
			continue;
		}
		if(song->id != last_id){
			if(song->artist && song->title){
				strcpy(info,"\"");
				strcat(info,song->artist);
				strcat(info,"\n");
				if(song->album){
					strcat(info,"Album: ");
					strcat(info,song->album);
					strcat(info,"\n");
				}
				strcat(info,"Tema: ");
				strcat(info,song->title);
				strcat(info,"\"");
				strcpy(instruccion,notify);
				strcat(instruccion,info);

				system(instruccion);
			}else{
				strcpy(instruccion,notify);
				strcat(instruccion,"\"");
				strcat(instruccion,song->file);
				strcat(instruccion,"\"");
				system(instruccion);
			}
			last_id = song->id;
		}
		mpd_freeInfoEntity(entity);
		mpd_finishCommand(conn);
	}
		
	mpd_closeConnection(conn);
	return 0;
}
