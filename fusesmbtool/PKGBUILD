# Contributor: Josef Lusticky <evramp@gmail.com>
# Maintainer: Josef Lusticky <evramp@gmail.com>

pkgname=fusesmbtool
pkgver=0.3
pkgrel=2
arch="any"
license="GPL"
pkgdesc="fusesmb frontend"
url="http://www.linuxmint.com/"
depends=('fusesmb' 'gtk2-perl')
source=(fusesmbtool fusesmbtool.desktop fusesmbtool.svg)
md5sums=('df4993d965f18143a1baaba41e6e04d6'
	'c83fa29c8b1e994fbff19420b78bb26d'
	'2c6dd9aa3ff49e280581387b1e950f3c')

build() {
  mkdir -p $startdir/pkg/usr/bin
  cp fusesmbtool $startdir/pkg/usr/bin
  chmod +x $startdir/pkg/usr/bin/fusesmbtool

  mkdir -p $startdir/pkg/usr/share/applications
  cp fusesmbtool.desktop $startdir/pkg/usr/share/applications

  mkdir -p $startdir/pkg/usr/share/icons/hicolor/scalable/apps
  cp fusesmbtool.svg $startdir/pkg/usr/share/icons/hicolor/scalable/apps
  mkdir -p  $startdir/pkg/usr/share/pixmaps
  cp fusesmbtool.svg $startdir/pkg/usr/share/pixmaps
}
