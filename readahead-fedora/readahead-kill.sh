#!/bin/bash

. /etc/readahead.conf

if [ "$(pidof readahead-collector)" ] 
then
  sleep ${TIMEOUT_AFTER_LOGIN} && touch /tmp/.kill_readahead-collector &
fi
