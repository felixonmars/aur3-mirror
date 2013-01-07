#!/bin/sh
/usr/bin/KillSpotifyController -silent
if [ ! -d $HOME/.spotify-controller ]; then
    mkdir $HOME/.spotify-controller
fi
echo Starting Spotify Controller...
cd $HOME/.spotify-controller 
DISPLAY=:0 java -jar /usr/lib/spotify-controller/spotifycontrollerservergui.jar
