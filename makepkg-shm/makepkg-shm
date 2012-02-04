#!/bin/bash
BUILDSCRIPT=PKGBUILD
srcdir=src

. $BUILDSCRIPT || (echo "Error: Failed to source \`$BUILDSCRIPT'"; exit 1)
volatile=/dev/shm/$USER/makepkg/$pkgname

if [[ -f $srcdir/.tmpfs ]]; then
  rm -rf $volatile $srcdir
  echo "Success: Purged \`$srcdir' and \`$volatile'"
elif [[ -e $srcdir && `readlink $srcdir` != $volatile ]]; then
  echo "Error: \`$srcdir' exists and is not a link to \`$volatile', aborting"; exit 2
else
  install -dm700 $volatile
  ln -s $volatile $srcdir
  touch $srcdir/.tmpfs
  echo "Success: \`$srcdir' linked to \`$volatile'"
fi
