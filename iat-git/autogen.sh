#!/bin/bash


# SET configure.ac

# version
GITVERSION=$(git log -1 --format=%cd --date=short | tr -d -)
GITDATEVERSION=GITDATEVERSION
# file name
CONFIGURE_AC=configure.ac
# edit configure.ac
sed -i "s/git.*.dev,/git.$GITVERSION.dev,/" $CONFIGURE_AC
sed -i "/^AM_INIT_AUTOMAKE/s/ \])/ subdir-objects ])/" $CONFIGURE_AC
sed -i "/^AM_INIT_AUTOMAKE/am4_ifdef([AM_PROG_AR], [AM_PROG_AR])" $CONFIGURE_AC
echo "configure.ac : OK";

autoreconf --install --force
echo "autoreconf : OK";
