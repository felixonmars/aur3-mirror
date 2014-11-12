#!/bin/bash

echo "## Locale informations" > "$2"
echo "## short | language | territory | titel" >> "$2"
echo "" >> "$2"

for file in "$1"/*
do
	FILENAME="$(echo "$file" | sed 's/^.*\///g')"

	COMMENTCHAR=$(cat "$file" | grep comment_char | sed 's/comment_char//g' | sed 's| ||g')
	if [ -z "$COMMENTCHAR" ]; then
		COMMENTCHAR="%"
	fi

	title=$(cat "$file" | sed -e "s|$COMMENTCHAR.*||g" -e 's/^ *//g' | grep '^title.*$' | sed -e 's|title *||' -e 's|\"||g' -e 's/^ *//g' -e 's/ *$//g' -e 's/^\t*//g' -e 's/\t*$//g')
	territory=$(cat "$file" | sed -e "s|$COMMENTCHAR.*||g" -e 's/^ *//g' | grep '^territory.*$' | sed -e 's|territory *||' -e 's|\"||g' -e 's/^ *//g' -e 's/ *$//g' -e 's/^\t*//g' -e 's/\t*$//g')
	language=$(cat "$file" | sed -e "s|$COMMENTCHAR.*||g" -e 's/^ *//g' | grep '^language.*$' | sed -e 's|language *||' -e 's|\"||g' -e 's/^ *//g' -e 's/ *$//g' -e 's/^\t*//g' -e 's/\t*$//g')

	echo "$FILENAME|$language|$territory|$title" >> "$2"
done
