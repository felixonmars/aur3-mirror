#!/bin/sh
export NO_EM_RESTART=1
mkdir $OBJDIR/_profileprofile
$OBJDIR/dist/bin/thunderbird -no-remote -profile $OBJDIR/_profileprofile