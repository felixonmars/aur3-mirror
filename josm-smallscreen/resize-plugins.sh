#!/bin/sh
backupdir=`mktemp -d /tmp/josm-plugins.XXXXXXXXXX`
cp -r ~/.josm/plugins $backupdir
echo Backup is in $backupdir. Press Enter to continue, Ctrl-C to cancel
read

for jarfile in `find ~/.josm/plugins -iname '*.jar'`; do
  tempdir=`mktemp -d /tmp/josm-smallscreen.XXXXXXXXXX`
  echo
  echo Processing $jarfile in $tempdir
  cd $tempdir
  fastjar -xf $jarfile
  if [ -e josm-smallscreen ]; then
    echo Already processed. Skipping...
    continue
  fi
  for image in `find -iname '*.png'`; do
    size=`identify $image | cut -f 3 -d ' ' | cut -f 1 -d x`
    if [ $size -ge 24 -a $size -le 48 ]; then
      echo Resizing $image "(was $size)"
      convert $image -resize 60% $image
    fi
  done
  echo
  touch josm-smallscreen

  # Create unsigned jar-file
  sed '/^\s\?$/q' -i META-INF/MANIFEST.MF # remove all but first paragraph
  rm -f META-INF/*.RSA META-INF/*.SF

  fastjar -cfm $jarfile META-INF/MANIFEST.MF *
  rm -rf $tempdir
done
