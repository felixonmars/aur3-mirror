#!/bin/sh -e

########################################################################
# Copy required CD data.  'makepkg' will follow the extract instructions:
#   http://home.roadrunner.com/~nwmovies/nwtoolset-43.html
# for the 4CD platinum set.
########################################################################

CDROMPATH="$1"
DEST="$2"

USAGE="$0 <CDROM Mount Point> <PKGBUILD Directory>"
if [ -z "$CDROMPATH" ]; then
    echo "$USAGE" >&2
    exit 1
fi

if [ -z "$DEST" ]; then
    echo "$USAGE" >&2
    exit 1
fi

if [ ! -d "$CDROMPATH" ]; then
    echo "CDROM path '$CDROMPATH' doesn't seem to be a directory." >&2
    echo "$USAGE" >&2
    exit 1
fi

if [ ! -d "$DEST" ]; then
    echo "Destination path '$DEST' doesn't seem to be a directory." >&2
    echo "$USAGE" >&2
    exit 1
fi

DEST=`echo "$DEST" | sed 's@/*$@/@'`

copy="rsync -P --inplace --size-only"

read -p "Please insert disk 2 and mount it at $CDROMPATH"
$copy "$CDROMPATH"/disk2.zip "$DEST"

read -p "Please insert disk 3 and mount it at $CDROMPATH"
$copy "$CDROMPATH"/{disk3.zip,language_data.zip,Data_Linux.zip} "$DEST"

read -p "Please insert disk 4 and mount it at $CDROMPATH"
$copy "$CDROMPATH"/{disk4.zip,xp1.zip,xp1_data.zip} "$DEST"

read -p "Please insert disk 1 and mount it at $CDROMPATH"
$copy "$CDROMPATH"/{Language_data.zip,Data_Shared.zip,Language_update.zip,EULA.txt,nwn.ico} "$DEST"
