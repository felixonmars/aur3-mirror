#!/bin/bash
#
# thunderbrand3 - a script to brand Thunderbird 3.0 without recompilation
#
# Based on firebrand script from http://bbs.archlinux.org/viewtopic.php?id=44320
# and thunderbrand script from archlinux-fr repository
#
# Currently works for en-US locale.  Modifications are necessary for other locales.
#
# This script replaces and changes (a few) files in an existing Thunderbird
# installation. Run it after a Thunderbird installation or upgrade, and restart
# Thunderbird. The program icon may not be (visibly) replaced until your desktop
# environment is restarted.
#
# To revert to the original brand, simply reinstall Thunderbird.
#
# Dependencies: wget, unzip, zip
#

THUNDERBIRDDIR=""                           # Where Thunderbird's data files resides. Usually something like /usr/lib/thunderbird-3.0.
                                            # If empty, autodetection is attempted.
NEWICONSDIR=""                              # If empty, the script uses a temporary directory for the replacement icons.
                                            # If you want to avoid downloading the icons every time you rebrand Thunderbird,
                                            # point NEWICONSDIR to a suitable directory.
SOURCEBASE="http://mxr.mozilla.org/comm-1.9.1/source/other-licenses/branding/thunderbird" # The URL under which the branding directory resides.



echo "This script must be launched as root to work."



die () {
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
            die 1 " is present but is not a file. Quitting."
        fi
    fi

    echo -n ": Downloading... "
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



if [ "x$THUNDERBIRDDIR" == "x" ] ; then
    THUNDERBIRDDIR=$(ls -1d /usr/lib/thunderbird-* | sort | tail -1)

    if [ "x$THUNDERBIRDDIR" == "x" ] ; then
        die 1 "Could not find the Thunderbird data directory."
    fi

    echo "Thunderbird data directory is ${THUNDERBIRDDIR}."
fi

if [ ! -d "$THUNDERBIRDDIR" ] ; then
    die 1 "$THUNDERBIRDDIR is not a directory."
fi

CHROMEDIR=$THUNDERBIRDDIR/chrome                # Simply the Thunderbird chrome directory.



TEMPDIR=$(mktemp -d -t thunderbrand-XXXXXXXX)

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
get_icon "about-credits.png"    "/content/about-credits.png?raw=1"
get_icon "about.png"            "/content/about.png?raw=1"
get_icon "icon48.png"           "/content/icon48.png?raw=1"
get_icon "icon64.png"           "/content/icon64.png?raw=1"
get_icon "default16.png"        "/mailicon16.png?raw=1"
get_icon "default22.png"        "/mailicon22.png?raw=1"
get_icon "default24.png"        "/mailicon24.png?raw=1"
get_icon "default32.png"        "/mailicon32.png?raw=1"
get_icon "default48.png"        "/mailicon48.png?raw=1"
get_icon "default256.png"       "/mailicon256.png?raw=1"



echo -e "\033[1mRE-BRANDING chrome/en-US.jar\033[0m"
echo -n " - Unzipping en-US.jar to ${TEMPDIR}... "
unzip -q -d "$TEMPDIR" "$CHROMEDIR/en-US.jar" locale/branding/brand.dtd locale/branding/brand.properties && echo "Done." || die 1 "Could not unzip branding files."

sed -r -i 's_(brandShortName=)[^"]+_\1Thunderbird_g' $TEMPDIR/locale/branding/brand.properties && echo " - Successfully edited ${TEMPDIR}/locale/branding/brand.properties" || die 1 "Could not edit ${TEMPDIR}/locale/branding/brand.properties"
sed -r -i 's_(brandFullName=)[^"]+_\1Mozilla Thunderbird_g' $TEMPDIR/locale/branding/brand.properties && echo " - Successfully edited ${TEMPDIR}/locale/branding/brand.properties" || die 1 "Could not edit ${TEMPDIR}/locale/branding/brand.properties"
sed -r -i 's_(vendorShortName=)[^"]+_\1Mozilla_g' $TEMPDIR/locale/branding/brand.properties && echo " - Successfully edited ${TEMPDIR}/locale/branding/brand.properties" || die 1 "Could not edit ${TEMPDIR}/locale/branding/brand.properties"
sed -r -i 's_(brandShortName[ \t]+)"[^"]+"_\1"Thunderbird"_g' $TEMPDIR/locale/branding/brand.dtd && echo " - Successfully edited ${TEMPDIR}/locale/branding/brand.dtd" || die 1 "Could not edit file ${TEMPDIR}/locale/branding/brand.dtd"
sed -r -i 's_(brandFullName[ \t]+)"[^"]+"_\1"Mozilla Thunderbird"_g' $TEMPDIR/locale/branding/brand.dtd && echo " - Successfully edited ${TEMPDIR}/locale/branding/brand.dtd" || die 1 "Could not edit file ${TEMPDIR}/locale/branding/brand.dtd"
sed -r -i 's_(vendorShortName[ \t]+)"[^"]+"_\1"Mozilla"_g' $TEMPDIR/locale/branding/brand.dtd && echo " - Successfully edited ${TEMPDIR}/locale/branding/brand.dtd" || die 1 "Could not edit file ${TEMPDIR}/locale/branding/brand.dtd"

echo " - Replacing branding files in en-US.jar"
( cd $TEMPDIR && zip -q -r "$CHROMEDIR/en-US.jar" locale/branding/* )



echo -e "\033[1mRE-BRANDING chrome/messenger.jar\033[0m"
echo " - Replacing branded icons in messenger.jar"
mkdir -p "$TEMPDIR/content/branding"
cp "$NEWICONSDIR"/{about-credits.png,about.png,icon48.png,icon64.png} "$TEMPDIR/content/branding/"
( cd $TEMPDIR && zip -q -r "$CHROMEDIR/messenger.jar" content/branding/* )



echo -e "\033[1mRE-BRANDING defaults/pref/all-thunderbird.js\033[0m"
sed -r -i 's_^(pref\("general.useragent.extra.thunderbird", ")[^/]+(/.*"\);[ \t]*)$_\1Thunderbird\2_' $THUNDERBIRDDIR/defaults/pref/all-thunderbird.js && echo " - Successfully edited $THUNDERBIRDDIR/defaults/pref/all-thunderbird.js" || die 1 "Could not edit $THUNDERBIRDDIR/defaults/pref/all-thunderbird.js"



echo -e "\033[1mRE-BRANDING thunderbird\033[0m"
sed -i 's|Shredder|Thunderbird|g' $THUNDERBIRDDIR/thunderbird && echo " - Successfully edited $THUNDERBIRDDIR/thunderbird" || die 1 "Could not edit $THUNDERBIRDDIR/thunderbird"



echo -e "\033[1mReplacing icons...\033[0m"
cp "$NEWICONSDIR"/{default16.png,default22.png,default24.png,default32.png,default48.png,default256.png} $THUNDERBIRDDIR/chrome/icons/default/
cp "$NEWICONSDIR/icon64.png" /usr/share/pixmaps/thunderbird.png
chmod 644 /usr/share/pixmaps/thunderbird.png
chown root:root /usr/share/pixmaps/thunderbird.png
