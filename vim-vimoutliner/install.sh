#!/bin/sh -e

pkgname=$1
src=$2
pkgdir=$3

docdir=$pkgdir/usr/share/doc/$pkgname
install -d $docdir/
install -m644 \
    $src/{CHANGELOG,INSTALL,LICENSE,VERSION,vimoutlinerrc} \
    $docdir/

install -d $pkgdir/usr/bin/
install -m755 $src/add-ons/scripts/otl2html.py $pkgdir/usr/bin/
install -m755 $src/scripts/vo_maketags.pl $pkgdir/usr/bin/

install -d $pkgdir/usr/share/vim/vimfiles/colors/
install -m644 $src/colors/* $pkgdir/usr/share/vim/vimfiles/colors/

for x in doc ftplugin syntax; do
    install -d $pkgdir/usr/share/vim/vimfiles/$x/
    install -m644 $src/$x/* $pkgdir/usr/share/vim/vimfiles/$x/
done

install -d $pkgdir/usr/share/vim/vimfiles/plugins/
install -m644 $src/add-ons/plugins/* $pkgdir/usr/share/vim/vimfiles/plugins/
