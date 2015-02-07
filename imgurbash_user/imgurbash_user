#!/bin/bash

# imgur script by Bart Nagel <bart@tremby.net>
# version 4
# I release this into the public domain. Do with it what you will.

# Required: curl, sed
#
# Optional: xsel or xclip for automatically putting the URLs on the X selection 
# for easy pasting
#
# Instructions:
# Put it somewhere in your path and maybe rename it:
# 	mv ~/Downloads/imgurbash.sh ~/bin/imgur
# Make it executable:
# 	chmod +x ~/bin/imgur
# Optional, since Alan kindly provided an API key for this script: stick your 
# API key in the top:
# 	vim ~/bin/imgur
# Upload an image:
# 	imgur images/hilarious/manfallingover.jpg
# Upload multiple images:
# 	imgur images/delicious/cake.png images/exciting/bungeejump.jpg
# The URLs will be displayed (and the delete page's URLs will be displayed on 
# stderr). If you have xsel or xclip the URLs will also be put on the X 
# selection, which you can usually paste with a middle click.

# OAuth and API Tokens provided by Westin Miller
API_CLIENT_ID=994ede8be8b3095
API_CLIENT_SECRET=8639fb13932d5f6cc1c049f21929c43e869dfd32

# function to output usage instructions
function usage {
	echo "Usage: $(basename $0) <filename> [<filename> [...]]" >&2
	echo "Upload images to imgur and output their new URLs to stdout. Each one's" >&2
	echo "delete page is output to stderr between the view URLs." >&2
	echo "If xsel or xclip is available, the URLs are put on the X selection for" >&2
	echo "easy pasting." >&2
}


function get_refresh_token {
	URL="https://api.imgur.com/oauth2/authorize?client_id=$API_CLIENT_ID&response_type=pin"
	if [[ -x $BROWSER ]]; then
		"$BROWSER" "$URL" &>/dev/null &
	else
		program="$(which xdg-open || which gnome-open)" && "$program" "$URL" &>/dev/null &
	fi
	echo "Attempting to open $URL in default browser"
	echo "Enter the generated PIN: "
	read pin
	response=`curl --silent --data "pin=$pin&grant_type=pin&client_id=$API_CLIENT_ID&client_secret=$API_CLIENT_SECRET" https://api.imgur.com/oauth2/token`
	echo $response | sed -r "s/^.*\"refresh_token\":\"([a-f0-9]+)\".*$/\1/" > ~/.imgur_refresh_token
	echo "Got refresh token: "
	cat ~/.imgur_refresh_token
}

# check arguments
if [ "$1" = "-h" -o "$1" = "--help" ]; then
	usage
	exit 0
elif [ $# == 0 ]; then
	echo "No file specified" >&2
	usage
	exit 16
fi

# check curl is available
type curl >/dev/null 2>/dev/null || {
	echo "Couln't find curl, which is required." >&2
	exit 17
}

clip=""
errors=false

if [ ! -f ~/.imgur_refresh_token ]; then 
	get_refresh_token
fi

while true; do
	response=`curl --silent --data "refresh_token=$(cat ~/.imgur_refresh_token)&client_id=$API_CLIENT_ID&client_secret=$API_CLIENT_SECRET&grant_type=refresh_token" https://api.imgur.com/oauth2/token`
	if [[ "$response" =~ "success\":false" ]];  then
		echo "Invalid refresh token, trying to get a new one."
		get_refresh_token
	else
		break
	fi
done

echo $response | sed -r "s/^.*\"refresh_token\":\"([a-f0-9]+)\".*$/\1/" > ~/.imgur_refresh_token
token=`echo $response | sed -r "s/^.*\"access_token\":\"([a-f0-9]+)\".*$/\1/"`
echo "Got token: $token"
echo "Refresh token: $(cat ~/.imgur_refresh_token)"

# loop through arguments
while [ $# -gt 0 ]; do
	file="$1"
	shift
	echo "Uploading $file"

	# check file exists
	if [ ! -f "$file" ]; then
		echo "file '$file' doesn't exist, skipping" >&2
		errors=true
		continue
	fi

	# upload the image
	response=$(curl -H "Authorization: Bearer $token" -H "Expect: " -F "image=@$file" \
		https://api.imgur.com/3/upload 2>/dev/null)
	# the "Expect: " header is to get around a problem when using this through 
	# the Squid proxy. Not sure if it's a Squid bug or what.
	if [ $? -ne 0 ]; then
		echo "Upload failed" >&2
		errors=true
		continue
	elif [[ "$response" =~ "success\":false" ]];  then
		echo "Error message from imgur:" >&2
		echo $response | sed -r 's/.*error\":\"(.*?)\",.*/\1/' >&2
		errors=true
		continue
	fi

	# parse the response and output our stuff
	url=$(echo $response | sed -r 's/.*link":"([^"]*?)".*/\1/')
	deletehash=$(echo $response | sed -r 's/.*deletehash":"([A-Za-z0-9]*?)".*/\1/')
	url=$(echo $url | sed -r 's/\\//g')
	echo $url
	echo "Delete hash: $deletehash" >&2

	# append the URL to a string so we can put them all on the clipboard later
	clip="$clip$url"
done

# put the URLs on the clipboard if we have xsel or xclip
if [ $DISPLAY ]; then
	{ type xsel >/dev/null 2>/dev/null && echo -n $clip | xsel; } \
		|| { type xclip >/dev/null 2>/dev/null && echo -n $clip | xclip; } \
		|| echo "Haven't copied to the clipboard: no xsel or xclip" >&2
else
	echo "Haven't copied to the clipboard: no \$DISPLAY" >&2
fi

if $errors; then
	exit 1
fi
