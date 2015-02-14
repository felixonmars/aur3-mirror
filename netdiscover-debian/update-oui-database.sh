#!/bin/bash

# Script for generation "oui.h" file (netdiscover program at
#   http://nixgeneration.com/~jaime/netdiscover/
#
# Obtain data from internet source at:
#   https://standards.ieee.org/develop/regauth/oui/oui.txt > oui.txt
#
# Syntax: oui.txt2oui.h_netdiscover
#
# Script generate src/oui.h file.
#
# 16-May-2009 Frantisek Hanzlik <franta@hanzlici.cz> (Original author)
# 07-Jun-2001 Larry Reznick <lreznick@rezfam.com> (fixes & code clean)
#**********************************************************************
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#

JA=${0##*/}
DATE=$(date +'%Y%m%d')
ORIGF=oui.txt
DSTD=src
DSTF=oui.h
URL="https://standards.ieee.org/develop/regauth/oui/oui.txt"
URL2="http://standards.ieee.org/develop/regauth/oui/oui.txt"
TMPF=$ORIGF-$DATE
AWK="gawk"
#AWK="mawk"
#AWK="awk"

[ -d "$DSTD" ] || { echo "$JA: Destdir \"$DSTD\" not exist!"; exit 1; }

if ! [ -f "$TMPF" -a -s "$TMPF" ]; then
  echo -n "Trying download \"$ORIGF\" with curl...
  "
  curl --insecure -fLC - --retry 3 --retry-delay 3 -o "$TMPF" $URL || curl -fLC - --retry 3 --retry-delay 3 -o "$TMPF" $URL2
else
   echo -n "\"$TMPF\" already exist, skipping download..."
fi
echo ""

if [ -f $TMPF ]; then
    echo "Process oui.txt (\"$TMPF\")..."
else
    echo "ERROR!! file $TMPF does not exist, using oui.txt backup"
    TMPF=oui.txt
fi

# if RS is null string, then records are separated by blank lines...
# but this isn't true in oui.txt

LANG=C grep "base 16" $TMPF | sed "s/\"/'/g" | $AWK --re-interval --assign URL="$URL" '
BEGIN {
	NN = 0;
	printf( \
	  "/*\n" \
	  " * Organizationally Unique Identifier list at date %s\n" \
	  " * Automatically generated from %s\n" \
	  " * For Netdiscover by Jaime Penalba\n" \
	  " *\n" \
	  " */\n" \
	  "\n" \
	  "struct oui {\n" \
	  "   char *prefix;   /* 24 bit global prefix */\n" \
	  "   char *vendor;   /* Vendor id string     */\n" \
	  "};\n" \
	  "\n" \
	  "struct oui oui_table[] = {\n", strftime("%d-%b-%Y"), URL);
}

{
	printf("   { \"%s\", \"", $1);
	for (i=4; i<NF; i++) printf $i " ";
	printf("%s\" },\n", $NF);
	NN++;
}

END {
	printf("   { NULL, NULL }\n};\n\n");
	printf("// Total %i items.\n\n", NN);
}' >"$DSTD/$DSTF"

if [ $? -ne 0 ]; then
  echo "$JA: $TMPF parsing error !"
  exit 1
else
  echo "All OK"
  ls -oh oui.txt* src/oui.h
fi
