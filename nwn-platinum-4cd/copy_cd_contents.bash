#!/bin/bash

########################################################################
# Copy required CD data.  'makepkg' will follow the extract instructions:
#   http://home.roadrunner.com/~nwmovies/nwtoolset-43.html
# for the 4CD platinum set.
########################################################################

CDROMPATH="$1"
DEST="$2"

readonly -a copy_list=(
    '{Language_data.zip,Data_Shared.zip,Language_update.zip,EULA.txt,nwn.ico}'
    'disk2.zip'
    '{disk3.zip,language_data.zip,Data_Linux.zip}'
    '{disk4.zip,xp1.zip,xp1_data.zip}'
)

USAGE="$0 <CDROM Mount Point> <PKGBUILD Directory>"
if [[ -z "$CDROMPATH" ]]; then
    echo "$USAGE" >&2
    exit 1
fi

if [[ -z "$DEST" ]]; then
    echo "$USAGE" >&2
    exit 1
fi

if [[ ! -d "$CDROMPATH" ]]; then
    echo "CDROM path '$CDROMPATH' doesn't seem to be a directory." >&2
    echo "$USAGE" >&2
    exit 1
fi

if [[ ! -d "$DEST" ]]; then
    echo "Destination path '$DEST' doesn't seem to be a directory." >&2
    echo "$USAGE" >&2
    exit 1
fi

DEST=`echo "$DEST" | sed 's@/*$@/@'`
CDROMPATH=`echo "$CDROMPATH" | sed 's@/*$@/@'`

copy="rsync -P --inplace --size-only --chmod=u+w,ugo+r"

for((i = 0; $i < "${#copy_list[*]}"; i++)); do
    NEXT=""
    while [[ -z "$NEXT" ]]; do
        read -p "Please insert CD $((i+1)) and mount it ([c]opy/[s]kip/[q]uit): "
        case "$REPLY" in
            "c")
                if ! eval $copy \""$CDROMPATH"\""${copy_list[$i]}" \""$DEST"\"; then
                    echo "Error copying files from CD mounted at path '$CDROMPATH'" >&2
                else
                    NEXT=1
                fi
                ;;
            "s") NEXT=1;;
            "q") echo "Exiting." && exit 0;;
            "*") echo "Choose either c, s, or q; c=copy, s=skip, q=quit" >&2;;
        esac
    done
done
