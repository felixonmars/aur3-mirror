#!/bin/bash
CONFIG=`ls ~/.config/ | grep pysshfs`
	if [[ $CONFIG != 'pysshfs' ]]
		then mkdir -p ~/.config/pysshfs
			  cp /usr/share/pysshfs/example.profil ~/.config/pysshfs/example.profil
	fi
pysshfs.py &