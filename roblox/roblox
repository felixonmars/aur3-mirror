#!/bin/sh

if [ "$#" != "3" ]
then
	echo "$0 username password joinid"
	exit
fi

curl -s -c /tmp/roblox -d username="$1" -d password="$2" "https://www.roblox.com/login/dologin.aspx" > /dev/null

# see if it is url or not
if echo "$3" | grep -q 'http://'
then
	id=$(echo "$3" | sed 's|.*?.*id=\([^&]*\)|\1|')
else
	id="$3"
fi

joinScriptUrl="$(curl -s -b /tmp/roblox -H "Content-Type: text/xml; charset=utf-8" -d '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><RequestGame xmlns="http://roblox.com/"><placeId>'$3'</placeId></RequestGame></soap:Body></soap:Envelope>' http://www.roblox.com/Game/PlaceLauncher.asmx |
sed -n 's|.*<joinScriptUrl>\([^<]*\)</joinScriptUrl>.*|\1|p')"

if [ -z "$joinScriptUrl" ]
then
	# retry
	echo 'Retrying'
	$0 $@
	exit 1
fi

echo 'Join Script Url:'
echo "$joinScriptUrl"
echo 'Running...'
echo
wine /usr/share/roblox/Roblox.exe -play "$joinScriptUrl" &> /dev/null
