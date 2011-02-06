#!/bin/bash
#
# firebrand - a script to brand firefox without recompilation
#
# This script replaces and changes (a few) files in an existing firefox
# installation. Run it after a firefox installation or upgrade, and restart
# firefox. The program icon may not be (visibly) replaced until your desktop
# environment is restarted.
#
# To revert to the original brand, simply reinstall firefox.
#
# Dependencies: wget, unzip, zip
#

FIREFOXDIR=""                               # Where firefox's data files resides. Usually something like /usr/lib/firefox-3.5.
                                            # If empty, autodetection is attempted.
NEWICONSDIR=""                              # If empty, the script uses a temporary directory for the replacement icons.
                                            # If you want to avoid downloading the icons every time you rebrand firefox,
                                            # point NEWICONSDIR to a suitable directory.
SOURCEBASE="http://mxr.mozilla.org/mozilla1.9.1/source" # The URL under which the "other-licenses" directory resides.



die() {
    local EXITCODE="${1:-9}"
    local MESSAGE="$2"

    [ "x$MESSAGE" == "x" ] || echo -e "$MESSAGE"

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
            die 1 " is present but is not a file. Quitting."
        fi
    fi

    echo -n ": Downloading... "
    #if curl -sSL "${SOURCEBASE}${SOURCEFILE}" > "$NEWICONSDIR/$ICON" ; then
    if wget -q -O - "${SOURCEBASE}${SOURCEFILE}" > "$NEWICONSDIR/$ICON" ; then
        echo "Done."
        return 0
    else
        die 1 "Failed."
    fi
}



for EXEC in wget unzip zip ; do
    if ! which $EXEC > /dev/null 2>&1 ; then
        die 1 "This script requires $EXEC to work."
    fi
done



if [ "x$FIREFOXDIR" == "x" ] ; then
    FIREFOXDIR=$(ls -1d /usr/lib/firefox-* | sort | tail -1)

    if [ "x$FIREFOXDIR" == "x" ] ; then
        die 1 "Could not find the Firefox data directory."
    fi

    echo "Firefox data directory is ${FIREFOXDIR}."
fi

if [ ! -d "$FIREFOXDIR" ] ; then
    die 1 "$FIREFOXDIR is not a directory."
fi

CHROMEDIR=$FIREFOXDIR/chrome                # Simply the firefox chrome directory.



TEMPDIR=$(mktemp -d -t firebrand-work-XXXXXXXX)

if [ $? -ne 0 ] ; then
    die 1 "Could not create temporary work directory."
fi

if [ "x$NEWICONSDIR" == "x" ] ; then
    NEWICONSDIR=$(mktemp -d -t firebrand-icon-XXXXXXXX)

    if [ $? -ne 0 ] ; then
        die 1 "Could not create temporary icon directory."
    fi
else
    [ -e "$NEWICONSDIR" ] || mkdir -p "$NEWICONSDIR" || die 1 "Could not create icon directory $NEWICONSDIR."
fi



echo -e "\033[1mChecking replacement icons\033[0m"
get_icon "mozicon50.xpm"    "/other-licenses/branding/firefox/mozicon50.xpm?raw=1"
get_icon "mozicon16.xpm"    "/other-licenses/branding/firefox/mozicon16.xpm?raw=1"
get_icon "mozicon128.png"   "/other-licenses/branding/firefox/mozicon128.png?raw=1"
get_icon "document.png"     "/other-licenses/branding/firefox/document.png?raw=1"
get_icon "icon48.png"       "/other-licenses/branding/firefox/content/icon48.png?raw=1"
get_icon "icon64.png"       "/other-licenses/branding/firefox/content/icon64.png?raw=1"
get_icon "about.png"        "/other-licenses/branding/firefox/content/about.png?raw=1"
get_icon "aboutCredits.png" "/other-licenses/branding/firefox/content/aboutCredits.png?raw=1"
get_icon "aboutFooter.png"  "/other-licenses/branding/firefox/content/aboutFooter.png?raw=1"
get_icon "default16.png"    "/other-licenses/branding/firefox/default16.png?raw=1"
get_icon "default22.png"    "/other-licenses/branding/firefox/default22.png?raw=1"
get_icon "default24.png"    "/other-licenses/branding/firefox/default24.png?raw=1"
get_icon "default32.png"    "/other-licenses/branding/firefox/default32.png?raw=1"
get_icon "default48.png"    "/other-licenses/branding/firefox/default48.png?raw=1"
get_icon "default256.png"    "/other-licenses/branding/firefox/default256.png?raw=1"
cp "$NEWICONSDIR/mozicon50.xpm" "$NEWICONSDIR/default.xpm"

echo -e "\033[1mBranding chrome/en-US.jar\033[0m"
echo -n " - Unzipping branding files in chrome/en-US.jar to temporary directory... "
unzip -q -d "$TEMPDIR" "$CHROMEDIR/en-US.jar" locale/branding/brand.dtd locale/branding/brand.properties && echo "Done." || die 1 "Failed."

#for FILE in $TEMPDIR/locale/branding/* ; do
#    sed -i "s|${OFFICIAL_NAME}|Firefox|g" "$FILE" && echo " - Successfully edited ${FILE}" || die 1 "Could not edit ${FILE}."
#done
sed -r -i 's_((brandShortName|brandFullName)[ \t]+)"[^"]+"_\1"Firefox"_g' $TEMPDIR/locale/branding/brand.dtd && echo " - Edited brand.dtd" || die 1 "Could not edit brand.dtd."
sed -r -i 's_^(brandShortName|brandFullName)=.*$_\1=Firefox_g' $TEMPDIR/locale/branding/brand.properties && echo " - Edited brand.properties" || die 1 "Could not edit brand.properties."

echo -n " - Replacing old branding files in chrome/en-US.jar... "
( cd $TEMPDIR && zip -q -r "$CHROMEDIR/en-US.jar" locale/branding/* ) && echo "Done." || die 1 "Failed."



echo -e "\033[1mBranding chrome/browser.jar\033[0m"
echo -n " - Making new branding icon structure in temporary directory... "
mkdir -p "$TEMPDIR/content/branding" || die 1 "Could not create $TEMPDIR/content/branding."
cp "$NEWICONSDIR"/{about.png,aboutCredits.png,aboutFooter.png,icon48.png,icon64.png} "$TEMPDIR/content/branding/" || die 1 "Could not copy new icons to $TEMPDIR/content/branding/."
echo "Done."
echo -n " - Replacing old branding icon structure in chrome/browser.jar... "
( cd $TEMPDIR && zip -q -r "$CHROMEDIR/browser.jar" content/branding/* ) && echo "Done." || die 1 "Failed."



echo -e "\033[1mBranding defaults/preferences/firefox.js\033[0m"
#sed -i "s|${USERAGENT_NAME}|Firefox|g" $FIREFOXDIR/defaults/preferences/firefox.js && echo " - Successfully edited $FIREFOXDIR/defaults/preferences/firefox.js." || die 1 "Could not edit $FIREFOXDIR/defaults/preferences/firefox.js."
sed -r -i 's_^(pref\("general.useragent.extra.firefox", ")[^/]+(/.*"\);[ \t]*)$_\1Firefox\2_' $FIREFOXDIR/defaults/preferences/firefox.js && echo " - Successfully edited $FIREFOXDIR/defaults/preferences/firefox.js." || die 1 "Could not edit $FIREFOXDIR/defaults/preferences/firefox.js."



echo -e "\033[1mBranding icons\033[0m"
echo -n " - Replacing icons in chrome/icons/default/... "
cp "$NEWICONSDIR"/{default256.png,default48.png,default32.png,default24.png,default22.png,default16.png} $FIREFOXDIR/chrome/icons/default/ && echo "Done." || die 1 "Failed."

echo -n " - Replacing icons in icons/... "
cp "$NEWICONSDIR"/{document.png,mozicon128.png,mozicon16.xpm,mozicon50.xpm} $FIREFOXDIR/icons/ && echo "Done." || die 1 "Failed."

chmod 644 $FIREFOXDIR/chrome/icons/default/* $FIREFOXDIR/icons/*
chown root:root $FIREFOXDIR/chrome/icons/default/* $FIREFOXDIR/icons/*

echo -n " - Replacing /usr/share/pixmaps/firefox.png: "
cp "$NEWICONSDIR/icon64.png" "/usr/share/pixmaps/firefox.png" && echo "Done." || die 1 "Failed."
chmod 644 /usr/share/pixmaps/firefox.png
chown root:root /usr/share/pixmaps/firefox.png
