
if  [ `id -u` = 0 ]; then

  kde_dir=`kde-config --prefix`

  if test -z "$kde_dir"; then
   kde_dir="/opt/kde"
  fi

  if test -n "$KDEDIR";then
    kde_dir="$KDEDIR"
  fi
else

  kde_dir=`kde-config --prefix`

  if test -z "$kde_dir"; then
   kde_dir="/opt/kde"
  fi

  if test -n "$KDEDIR";then
    kde_dir="$KDEDIR"
  fi
fi

echo "Install dir [${1}${kde_dir}/share/apps/quanta/doc]:"

newdir="${1}${kde_dir}/share/apps/quanta/doc";


if  ! [ -d $newdir ]; then
    IFS="/"
    for filename in $newdir
    do
      IFS=""
      if [ "$filename" == "" ] ; then continue; 
      else currPath=$currPath/$filename;
      fi
      if [ -d "$currPath" ]; then continue;
      else mkdir $currPath;
      fi
      done
fi



cp -R php php.docrc "$newdir" && echo "done"