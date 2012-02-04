# Contributor: wain <wain@archlinux.fr>
pkgname=snackamp-beta
pkgver=3.1.3
pkgrel=20070930
pkgdesc="music player with poweful feature and integrated web server (beta)"
url="http://snackamp.sourceforge.net/"
license="GPL"
depends=('metakit' 'tcl' 'libxext')
arch=('i686' 'x86_64')
conflicts=('snackamp')
source=(http://snackamp.sourceforge.net/releases/snackAmp-$pkgver.i386.tar.gz)
build() {
  install -d $startdir/pkg/usr/share/snackamp/
  install -m 755 $startdir/src/linux/* $startdir/pkg/usr/share/snackamp/
  install -d $startdir/pkg/usr/bin 
  echo '#!/bin/bash' > $startdir/pkg/usr/bin/snackamp 
  echo 'cd /usr/share/snackamp/ && ./snackAmp' >> $startdir/pkg/usr/bin/snackamp
  chmod +x  $startdir/pkg/usr/bin/snackamp
}
md5sums=('5fef5f7a837789a73d01fb97e1c2eaad')
