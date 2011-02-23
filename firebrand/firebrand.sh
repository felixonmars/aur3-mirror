#!/bin/bash
#README {{{
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
# AUR...: https://aur.archlinux.org/packages.php?ID=34559
# FORUM.: https://bbs.archlinux.org/viewtopic.php?id=44320
#}}}

#config {{{
# Where firefox's data files resides. Usually something like
# /usr/lib/firefox-3.6. If empty, autodetection is attempted.
FXDIR=""

# If empty, the script uses a temporary directory for the replacement icons.
# If you want to avoid downloading the icons every time you rebrand firefox,
# point NEWICONSDIR to a suitable directory.
NEWICONSDIR=""

# The URL under which the "other-licenses" directory resides.
SOURCEBASE="http://mxr.mozilla.org/mozilla1.9.1/source"
#}}}

#function die {{{
die() {
  local EXITCODE="${1:-9}"
  local MESSAGE="$2"

  [ "x$MESSAGE" == "x" ] || echo -e "$MESSAGE"
  exit $EXITCODE
}
#}}}

#function: get_icon {{{
get_icon() {
  local ICON="$1"
  local SOURCEFILE="$2"

  echo -n " - $ICON"

  if [ -e "$NEWICONSDIR/$ICON" ]; then
    if [ -f "$NEWICONSDIR/$ICON" ]; then
      echo " is present."
      return 0
    else
      die 1 " is present but is not a file. Quitting."
    fi
  fi

  echo -n ": Downloading... "

  if wget -q -O - "$SOURCEBASE$SOURCEFILE" > "$NEWICONSDIR/$ICON"; then
    echo "Done."
    return 0
  else
    die 1 "Failed."
  fi
}
#}}}

#requires {{{
if [ $EUID -ne 0 ]; then
  die 1 "This script should be run as root."
fi

for EXEC in wget unzip zip; do
  if ! which $EXEC > /dev/null 2>&1; then
    die 1 "This script requires $EXEC to work."
  fi
done
#}}}

#find_application_dir {{{
if [ "x$FXDIR" == "x" ]; then
  FXDIR=$(ls -1d /usr/lib/firefox-* | sort | tail -1)
  if [ "x$FXDIR" == "x" ] ; then
    die 1 "Could not find the Firefox data directory."
  fi
  echo "Firefox data directory is $FXDIR."
fi

if [ ! -d "$FXDIR" ]; then
  die 1 "$FXDIR is not a directory."
fi
#}}}

#set_dirs {{{
CHROMEDIR=$FXDIR/chrome            # Simply the firefox chrome directory.

BRAND_DTD="locale/branding/brand.dtd"
BRAND_PRO="locale/branding/brand.properties"
CBRAND="content/branding"

TEMPDIR=$(mktemp -d -t firebrand-work-XXXXXXXX)
if [ $? -ne 0 ]; then
  die 1 "Could not create temporary work directory."
fi

if [ "x$NEWICONSDIR" == "x" ] ; then
  NEWICONSDIR=$(mktemp -d -t firebrand-icon-XXXXXXXX)
  if [ $? -ne 0 ]; then
    die 1 "Could not create temporary icon directory."
  fi
else
  [ -e "$NEWICONSDIR" ] || mkdir -p "$NEWICONSDIR" || \
    die 1 "Could not create icon directory $NEWICONSDIR."
fi
#}}}

#get_icons {{{
echo -e "\033[1mChecking replacement icons\033[0m"
SOURCESUBBASE="/other-licenses/branding/firefox/"
get_icon "mozicon50.xpm"    "${SOURCESUBBASE}/mozicon50.xpm?raw=1"
get_icon "mozicon16.xpm"    "${SOURCESUBBASE}/mozicon16.xpm?raw=1"
get_icon "mozicon128.png"   "${SOURCESUBBASE}/mozicon128.png?raw=1"
get_icon "document.png"     "${SOURCESUBBASE}/document.png?raw=1"
get_icon "icon48.png"       "${SOURCESUBBASE}/content/icon48.png?raw=1"
get_icon "icon64.png"       "${SOURCESUBBASE}/content/icon64.png?raw=1"
get_icon "about.png"        "${SOURCESUBBASE}/content/about.png?raw=1"
get_icon "aboutCredits.png" "${SOURCESUBBASE}/content/aboutCredits.png?raw=1"
get_icon "aboutFooter.png"  "${SOURCESUBBASE}/content/aboutFooter.png?raw=1"
get_icon "default16.png"    "${SOURCESUBBASE}/default16.png?raw=1"
get_icon "default22.png"    "${SOURCESUBBASE}/default22.png?raw=1"
get_icon "default24.png"    "${SOURCESUBBASE}/default24.png?raw=1"
get_icon "default32.png"    "${SOURCESUBBASE}/default32.png?raw=1"
get_icon "default48.png"    "${SOURCESUBBASE}/default48.png?raw=1"
get_icon "default256.png"   "${SOURCESUBBASE}/default256.png?raw=1"
cp "$NEWICONSDIR/mozicon50.xpm" "$NEWICONSDIR/default.xpm"
#}}}

#branding {{{
echo -e "\033[1mBranding chrome/en-US.jar\033[0m"
echo -n " - Unzipping branding files in chrome/en-US.jar to temporary directory... "
unzip -q -d "$TEMPDIR" "$CHROMEDIR/en-US.jar" $BRAND_DTD $BRAND_PRO && \
  echo "Done." || die 1 "Failed."

#brand.dtd
sed -r -i 's_(brandShortName[ \t]+)"[^"]+"_\1"Firefox"_g' \
  $TEMPDIR/$BRAND_DTD && echo ' - Edited brand.dtd' || \
  die 1 'Could not edit brand.dtd.'

sed -r -i 's_(brandFullName[ \t]+)"[^"]+"_\1"Mozilla Firefox"_g' $TEMPDIR/$BRAND_DTD
sed -r -i 's_(vendorShortName[ \t]+)"[^"]+"_\1"Mozilla"_g' $TEMPDIR/$BRAND_DTD
sed -r -i 's_(logoCopyright[ \t]+)"[^"]+"_\1"Firefox and the Firefox logos are trademarks of the Mozilla Foundation. All rights reserved."_g' $TEMPDIR/$BRAND_DTD

#brand.properties
sed -r -i 's_^(brandShortName)=.*$_\1=Firefox_g' \
  $TEMPDIR/$BRAND_PRO && echo " - Edited brand.properties" || \
  die 1 "Could not edit brand.properties."

sed -r -i 's_^(brandFullName)=.*$_\1=Mozilla Firefox_g' $TEMPDIR/$BRAND_PRO
sed -r -i 's_^(vendorShortName)=.*$_\1=Mozilla_g' $TEMPDIR/$BRAND_PRO

echo -n " - Replacing old branding files in chrome/en-US.jar... "
( cd $TEMPDIR && zip -q -r "$CHROMEDIR/en-US.jar" locale/branding/* ) && \
  echo "Done." || die 1 "Failed."

echo -e "\033[1mBranding chrome/browser.jar\033[0m"
echo -n " - Making new branding icon structure in temporary directory... "
mkdir -p "$TEMPDIR/$CBRAND" || die 1 "Could not create $TEMPDIR/$CBRAND."
cp "$NEWICONSDIR"/{about.png,aboutCredits.png,aboutFooter.png,icon48.png,icon64.png} \
  "$TEMPDIR/$CBRAND/" || die 1 "Could not copy new icons to $TEMPDIR/$CBRAND/."
echo "Done."

echo -n " - Replacing old branding icon structure in chrome/browser.jar... "
( cd $TEMPDIR && zip -q -r "$CHROMEDIR/browser.jar" $CBRAND/* ) && \
  echo "Done." || die 1 "Failed."

echo -e "\033[1mBranding defaults/preferences/firefox.js\033[0m"
sed -r -i 's_^(pref\("general.useragent.extra.firefox", ")[^/]+(/.*"\);[ \t]*)$_\1Firefox\2_' \
  $FXDIR/defaults/preferences/firefox.js && \
  echo " - Successfully edited $FXDIR/defaults/preferences/firefox.js." || \
  die 1 "Could not edit $FXDIR/defaults/preferences/firefox.js."

echo -e "\033[1mBranding icons\033[0m"
echo -n " - Replacing icons in chrome/icons/default/... "
cp "$NEWICONSDIR"/{default256.png,default48.png,default32.png,default24.png,default22.png,default16.png} \
  $CHROMEDIR/icons/default/ && echo "Done." || die 1 "Failed."

echo -n " - Replacing icons in icons/... "
cp "$NEWICONSDIR"/{document.png,mozicon128.png,mozicon16.xpm,mozicon50.xpm} \
  $FXDIR/icons/ && echo "Done." || die 1 "Failed."

chmod 644 $CHROMEDIR/icons/default/* $FXDIR/icons/*
chown root:root $CHROMEDIR/icons/default/* $FXDIR/icons/*

echo -n " - Replacing /usr/share/pixmaps/firefox.png: "
cp "$NEWICONSDIR/icon64.png" "/usr/share/pixmaps/firefox.png" && \
  echo "Done." || die 1 "Failed."

chmod 644 /usr/share/pixmaps/firefox.png
chown root:root /usr/share/pixmaps/firefox.png
#}}}
# vim: ft=sh ts=2 sw=2 et fen:
