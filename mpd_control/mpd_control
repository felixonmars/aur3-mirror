#!/bin/bash

#when set to exit, mpd_control will exit if you press escape
#when set to break, mpd_control will go the upper level if possible
ESC_ACTION="break"
# source configuration file for dmenu if exists

if [ -f $HOME/.dmenurc ]; then
  . $HOME/.dmenurc
else
  DMENU='dmenu -i'
fi

addaftercurrent(){
	
	#playlist is empty, just add the song
	if [ "$(mpc playlist | wc -l)" == "0" ]; then
		mpc add "$1" 

	#there is no current song so mpd is stopped
	#it seems to be impossible to determine the current songs' position when 
	#mpd is stopped, so just add to the end
	elif [ -z "$(mpc current)" ]; then 
		mpc play
		CUR_POS=$(mpc | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc playlist | wc -l)
		mpc add "$1"
		mpc move $(($END_POS+1)) $(($CUR_POS+1))	
		mpc stop

	#at least 1 song is in the playlist, determine the position of the 
	#currently played song and add $1 after it
	else

		CUR_POS=$(mpc | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc playlist | wc -l)
		mpc add "$1"
		mpc move $(($END_POS+1)) $(($CUR_POS+1))	
	fi
}
addaftercurrentandplay(){

	#playlist is empty, just add the song
	if [ "$(mpc playlist | wc -l)" == "0" ]; then
		mpc add "$1" 
		mpc play

	#there is no current song so mpd is stopped
	#it seems to be impossible to determine the current songs' position when 
	#mpd is stopped, so just add to the end
	elif [ -z "$(mpc current)" ]; then 
		mpc play
		CUR_POS=$(mpc | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc playlist | wc -l)
		mpc add "$1"
		mpc move $(($END_POS+1)) $(($CUR_POS+1))	
		mpc play $(($CUR_POS+1))

	#at least 1 song is in the playlist, determine the position of the 
	#currently played song and add $1 after it
	else

		CUR_POS=$(mpc | tail -2 | head -1 | awk '{print $2}' | sed 's/#//' | awk -F/ '{print $1}')
		END_POS=$(mpc playlist | wc -l)
		mpc add "$1"
		mpc move $(($END_POS+1)) $(($CUR_POS+1))	
		mpc play $(($CUR_POS+1))
	fi
}

case $1 in
	
	-a|--artist)
	
	while true; do

		ARTIST="$(mpc list artist | sort -f | $DMENU)";
		if [ "$ARTIST" = "" ]; then $ESC_ACTION; fi
		
		while true; do

			ALBUMS=$(mpc list album artist "$ARTIST" | sort -f);
			ALBUM=$(echo -e "replace all\nadd all\n--------------------------\n$ALBUMS" | $DMENU);
			if [ "$ALBUM" = "" ]; then $ESC_ACTION;
			
			elif [ "$ALBUM" = "replace all" ]; then
				CUR_SONG=$(mpc current)
				mpc clear
				mpc find artist "$ARTIST" | mpc add 
				if [ -n "$CUR_SONG" ]; then mpc play; fi
				$ESC_ACTION
			elif [ "$ALBUM" = "add all" ]; then 
				mpc find artist "$ARTIST" | mpc add
				$ESC_ACTION
			fi
			
			while true; do
				
				TITLES=$(mpc list title artist "$ARTIST" album "$ALBUM")
				TITLE=$(echo -e "replace all\nadd all\n--------------------------\n$TITLES" | $DMENU);
				if [ "$TITLE" = "" ]; then $ESC_ACTION
				elif [ "$TITLE" = "replace all" ]; then
					CUR_SONG=$(mpc current)
					mpc clear;
					mpc find artist "$ARTIST" album "$ALBUM" | mpc add 
					if [ -n "$CUR_SONG" ]; then mpc play; fi
					$ESC_ACTION
				elif [ "$TITLE" = "add all" ]; then
					mpc find artist "$ARTIST" album "$ALBUM" | mpc add 
					$ESC_ACTION
				
				fi

				while true; do
					DEC=$(echo -e "add after current and play\nadd after current\nreplace\nadd at the end" | $DMENU);
					case $DEC in 

						"")
						$ESC_ACTION
						;;

						"add after current and play")
						addaftercurrentandplay "$(mpc find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 )"
						;;

						"add after current")
						addaftercurrent "$(mpc find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 )"
						;;

						"replace")
						CUR_SONG=$(mpc current)
						mpc clear
						mpc find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 | mpc add
						if [ -n "$CUR_SONG" ]; then mpc play; fi
						;;
						
						"add at the end")
						mpc find artist "$ARTIST" album "$ALBUM" title "$TITLE" | head -1 | mpc add
						;;

					esac
					$ESC_ACTION
				done
			done
		done
	done
	;;

	-t|--track)
		
	TITLE=$(mpc list title | sort -f | $DMENU)
	if [ "$TITLE" = "" ]; then exit; fi
	
	SONG=$(mpc find title "$TITLE" | head -1) 
	addaftercurrentandplay "$SONG"
	;;

	-p|--playlist)
	PLAYLIST=$(mpc lsplaylists | $DMENU);
	if [ "$PLAYLIST" = "" ]; then exit; fi
	CUR_SONG=$(mpc current)
	mpc clear
	mpc load "$PLAYLIST";
	if [ -n "$CUR_SONG" ]; then mpc play; fi
	;;

	-j|--jump)
	
	TITLE=$(mpc playlist | $DMENU);
	if [ "$TITLE" = "" ]; then exit; fi
	POS=$(mpc playlist | grep -n "$TITLE" | awk -F: '{print $1}')
	mpc play $POS;
	;;

	-l|--longplayer)
	
	while true; do

		ALBUM=$(mpc list album | sort -f | $DMENU);
		if [ "$ALBUM" = "" ]; then $ESC_ACTION;
		fi
		
		while true; do
			
			TITLES=$(mpc list title album "$ALBUM")
			TITLE=$(echo -e "replace all\nadd all\n--------------------------\n$TITLES" | $DMENU);
			if [ "$TITLE" = "" ]; then $ESC_ACTION
			elif [ "$TITLE" = "replace all" ]; then
				CUR_SONG=$(mpc current)
				mpc clear;
				mpc find album "$ALBUM" | mpc add 
				if [ -n "$CUR_SONG" ]; then mpc play; fi
				$ESC_ACTION
			elif [ "$TITLE" = "add all" ]; then
				mpc find album "$ALBUM" | mpc add 
				$ESC_ACTION
			
			fi

			while true; do
				DEC=$(echo -e "add after current and play\nadd after current\nreplace\nadd at the end" | $DMENU);
				case $DEC in 

					"")
					$ESC_ACTION
					;;

					"add after current and play")
					addaftercurrentandplay "$(mpc find album "$ALBUM" title "$TITLE" | head -1 )"
					;;

					"add after current")
					addaftercurrent "$(mpc find album "$ALBUM" title "$TITLE" | head -1 )"
					;;

					"replace")
					CUR_SONG=$(mpc current)
					mpc clear
					mpc find album "$ALBUM" title "$TITLE" | head -1 | mpc add
					if [ -n "$CUR_SONG" ]; then mpc play; fi
					;;
					
					"add at the end")
					mpc find album "$ALBUM" title "$TITLE" | head -1 | mpc add
					;;

				esac
				$ESC_ACTION
			done
		done
	done
	;;

	-h|--help)
	echo -e "-a, --artist		search for artist, then album, then title"
    echo -e "-t, --track		search for a single track in the whole database"
	echo -e "-p, --playlist		search for a playlist load it"
	echo -e "-j, --jump		jump to another song in the current playlist"		 
	echo -e "-l, --longplayer	search for album, then title"
	
	
	
	
	;;
	
	*)
	echo "Usage: mpc_control [OPTION]"
	echo "Try 'mpc_control --help' for more information."
	;;

esac
