# Contributor: muhas <muhas@muhas.ru>

pkgname=lightgreymodded-gtk-theme
pkgver=0.0.2
pkgrel=2
pkgdesc="LightGrey gtk theme modded by muhas"
arch=('any')
license=('LGPL')
url=('http://repo.muhas.ru')
source=(LightGreyModded.gtk.tar.gz)
md5sums=('cfe217eb1dc76e9786cde8ecb1443b43')

build() {
  mkdir -p $pkgdir/usr/share/themes/LightGreyModded 
  cp -r $srcdir/LightGreyModded/* $pkgdir/usr/share/themes/LightGreyModded
  chmod 755  $pkgdir/usr/share/themes/LightGreyModded/gtk-2.0
  chmod -R 644  $pkgdir/usr/share/themes/LightGreyModded/gtk-2.0/*
}



