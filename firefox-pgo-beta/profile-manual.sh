#!/bin/dash

export NO_EM_RESTART=1
mkdir $OBJDIR/_profilemanual
$OBJDIR/dist/bin/firefox -no-remote -profile $OBJDIR/_profilemanual
