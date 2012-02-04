#!/bin/sh
#
# sunbrand - a script to brand sunbird without recompilation
#
#
# This script replaces and changes (a few) files in an existing sunbird 
# installation. Run it after a sunbird installation or upgrade, and restart 
# sunbird. The program icon may not be (visibly) replaced until your desktop 
# environment is restarted.
#
# To revert to the original brand, simply reinstall sunbird.
#
# Dependencies: curl, zip, unzip, imagemagick
#

#SUNBIRDDIR: Where sunbird's data files resides.

SUNBIRDDIR=/usr/lib/sunbird
SUNBIRDSTRING="Calendar"
SUNBIRDSTRINGPREFS="Calendar"

NEWICONSDIR="./sunbird-icons"               # If empty, the script uses a temporary directory for the replacement icons.
                                            # If you want to avoid downloading the icons every time you rebrand sunbird,
                                            # point NEWICONSDIR to a suitable directory.

SOURCEBASE="http://mxr.mozilla.org/seamonkey/source" # The URL under which the "other-licenses" directory resides.


CHROMEDIR=$SUNBIRDDIR/chrome                # Simply the sunbird chrome directory.



die() {
    EXITCODE="${1:-9}"
    MESSAGE="$2"

    echo -e "\n$MESSAGE"

    exit $EXITCODE
}



get_icon() {
    local ICON="$1"
    local SOURCEFILE="$2"

    echo -n " - $ICON"

    if [ -e "$NEWICONSDIR/$ICON" ] ; then
        if [ -f "$NEWICONSDIR/$ICON" ] ; then
            echo " is present."
            return 0
        else
            echo " is present but is not a file. Quitting."
            exit 1
        fi
    fi

    echo -n ": Downloading... "
    if curl -sS "${SOURCEBASE}${SOURCEFILE}" > "$NEWICONSDIR/$ICON" ; then
        echo "Done."
        return 0
    else
        exit 1
    fi
}



TEMPDIR=$(mktemp -d -t sunbrand-work-XXXXXXXX)

if [ $? -ne 0 ] ; then
    die 1 "Could not create temporary work directory."
fi

if [ "x$NEWICONSDIR" == "x" ] ; then
    NEWICONSDIR=$(mktemp -d -t sunbrand-icon-XXXXXXXX)

    if [ $? -ne 0 ] ; then
        die 1 "Could not create temporary icon directory."
    fi
else
    [ -e "$NEWICONSDIR" ] || mkdir -p "$NEWICONSDIR" || die 1 "Could not create icon directory $NEWICONSDIR."
fi



echo -e "\033[1mChecking replacement icons\033[0m"
get_icon "mozicon50.xpm"    "/other-licenses/branding/sunbird/mozicon50.xpm?raw=1"
get_icon "mozicon16.xpm"    "/other-licenses/branding/sunbird/mozicon16.xpm?raw=1"
get_icon "mozicon128.png"   "/other-licenses/branding/sunbird/mozicon128.png?raw=1"
#get_icon "default.xpm"      "/other-licenses/branding/sunbird/default.xpm?raw=1"
get_icon "icon48.png"       "/other-licenses/branding/sunbird/content/icon48.png?raw=1"
get_icon "icon64.png"       "/other-licenses/branding/sunbird/content/icon64.png?raw=1"
get_icon "about.png"        "/other-licenses/branding/sunbird/content/about.png?raw=1"
get_icon "aboutCredits.png" "/other-licenses/branding/sunbird/content/aboutCredits.png?raw=1"
get_icon "aboutFooter.png"  "/other-licenses/branding/sunbird/content/aboutFooter.png?raw=1"

cp "$NEWICONSDIR/mozicon50.xpm" "$NEWICONSDIR/default.xpm"
convert -resize 48x48 "$NEWICONSDIR/mozicon50.xpm" "$NEWICONSDIR/default48.png"
convert -resize 48x48 "$NEWICONSDIR/default.xpm"   "$NEWICONSDIR/default.xpm"
convert -resize 32x32 "$NEWICONSDIR/mozicon50.xpm" "$NEWICONSDIR/default32.png"
convert -resize 16x16 "$NEWICONSDIR/mozicon50.xpm" "$NEWICONSDIR/default16.png"



echo -e "\033[1mBranding chrome/en-US.jar\033[0m"
echo -n " - Unzipping branding files in chrome/en-US.jar to temporary directory... "
unzip -q -d "$TEMPDIR" "$CHROMEDIR/en-US.jar" locale/branding/brand.dtd locale/branding/brand.properties && echo "Done." || die 1 "Failed."

for FILE in $TEMPDIR/locale/branding/* ; do
    sed -i "s|$SUNBIRDSTRING|Sunbird|g" "$FILE" && echo " - Successfully edited ${FILE}" || die 1 "Could not edit ${FILE}."
done

echo -n " - Replacing old branding files in chrome/en-US.jar... "
( cd $TEMPDIR && zip -q -r "$CHROMEDIR/en-US.jar" locale/branding/* ) && echo "Done." || die 1 "Failed."



echo -e "\033[1mBranding chrome/calendar.jar\033[0m"
echo -n " - Making new branding icon structure in temporary directory... "
mkdir -p "$TEMPDIR/content/branding" || die 1 "Could not create $TEMPDIR/content/branding."
cp "$NEWICONSDIR"/{about.png,aboutCredits.png,aboutFooter.png,icon48.png,icon64.png} "$TEMPDIR/content/branding/" || die 1 "Could not copy new icons to $TEMPDIR/content/branding/."
echo "Done."
echo -n " - Replacing old branding icon structure in chrome/calendar.jar... "
( cd $TEMPDIR && zip -q -r "$CHROMEDIR/calendar.jar" content/branding/* ) && echo "Done." || die 1 "Failed."



echo -e "\033[1mBranding defaults/preferences/sunbird.js\033[0m"
sed -i "s|$SUNBIRDSTRINGPREFS|Sunbird|g" $SUNBIRDDIR/defaults/pref/sunbird.js && echo " - Successfully edited $SUNBIRDDIR/defaults/pref/sunbird.js." || die 1 "Could not edit $SUNBIRDDIR/defaults/pref/sunbird.js."



echo -e "\033[1mBranding icons\033[0m"
echo -n " - Replacing icons in chrome/icons/default/... "
cp "$NEWICONSDIR"/{default48.png,default32.png,default16.png,default.xpm} $SUNBIRDDIR/chrome/icons/default/ && echo "Done." || die 1 "Failed."

echo -n " - Replacing icons in icons/... "
#cp "$NEWICONSDIR"/{document.png,mozicon128.png,mozicon16.xpm,mozicon50.xpm} $SUNBIRDDIR/icons/ && echo "Done." || die 1 "Failed."
cp "$NEWICONSDIR"/{mozicon128.png,mozicon16.xpm,mozicon50.xpm} $SUNBIRDDIR/icons/ && echo "Done." || die 1 "Failed."

chmod 644 $SUNBIRDDIR/chrome/icons/default/* $SUNBIRDDIR/icons/*
chown root:root $SUNBIRDDIR/chrome/icons/default/* $SUNBIRDDIR/icons/*

echo -n " - Replacing /usr/share/pixmaps/sunbird.png: "
convert "$NEWICONSDIR/default.xpm" /usr/share/pixmaps/sunbird.png && echo "Done." || die 1 "Failed."
chmod 644 /usr/share/pixmaps/sunbird.png 
chown root:root /usr/share/pixmaps/sunbird.png
