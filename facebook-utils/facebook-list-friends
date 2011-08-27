#!/bin/sh

# this is a hack and is not through the Official Facebook API
# by dabom
# http://www.commandlinefu.com/commands/view/4749/facebook-email-scraper

[ "$#" != "2" ] && echo "Usage: $0 email password" && exit 1

id=$(curl -m 5 --retry 1 -c /tmp/cookies -A "Opera" -Ls -d "email=$1&pass=$2&persistent=1" "https://login.facebook.com/login.php?m&next=http://m.facebook.com/profile.php" | grep -o "\&am\p\;id=.*&am\p;v=feed\&am\p;refid=17" | sed -e "s/.*profile.*id=\(.*\)\&am\p\;v=feed.*/\1/g")

tmp=/tmp/facebook-list-friends

curl -m 5 --retry 1 -b /tmp/cookies -Ls -A "Opera" "http://www.facebook.com/ajax/typeahead_friends.php?u=$id&__a=1" | tr "{" "\n" | grep facebook | sed "s/\"t\":\"\(.*\)\",\"i\":.*\"u\":\"\(.*\)\",\"n\":\".*/\1,\2/g" |
while read line
do
	curl -m 5 --retry 1 -b /tmp/cookies -A "Opera" -Ls $(echo $line | cut -d , -f2 | tr -d "\\\\" | sed "s/www/m/g" | awk '{print $0 "?v=info&refid=17"}' | sed "/profile.php/s/?v=info/\&v=info/g") | tee $tmp > /dev/null
	echo $(echo "$line" | cut -d , -f1)';'$(cat "$tmp" | grep 'Mobile Number:' | sed 's|.*<td class="label">Mobile Number:</td><td ><a href="[^"]*">\([^<]*\)</a></td></tr>.*|\1|')';'$(cat "$tmp" | grep 'Sex:' | sed 's|.*<tr><td class="label" valign="top">Sex:</td><td  valign="top">\([^<]*\)</td></tr>.*|\1|')';'$(cat "$tmp" | grep 'Birthday:' | sed 's|.*<tr><td class="label" valign="top">Birthday:</td><td  valign="top">\([^<]*\)</td></tr>.*|\1|')';'$(cat "$tmp" | tr \< "\n" | tr \> "\n" | grep "@.*\." | grep -v " ")
done

rm /tmp/cookies "$tmp"
