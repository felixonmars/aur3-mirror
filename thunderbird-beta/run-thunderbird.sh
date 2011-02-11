#!/bin/sh
export NO_EM_RESTART=1
mkdir $OBJDIR/_profileprofile
$OBJDIR/mozilla/dist/bin/thunderbird-bin -no-remote -profile $OBJDIR/_profileprofile