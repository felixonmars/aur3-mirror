# Maintainer: Romain Schmitz <slopjong at archlinux dot lu>

pkgname=scan-s2
pkgver=20121125
pkgrel=1
pkgdesc="Scan tool for the Linux DVB S2 API"
arch=('i686' 'x86_64')
url="https://example.com"
license=('GPL')
depends=('linux-api-headers')
source=('http://slopjong.de/wp-content/2012/11/scan-s2.tar.bz2')
md5sums=('7ba9b2ccfa43890e61235d7cb202487e')

build() {
  cd $srcdir/scan-s2
  make
 }
 
 package() {
  mkdir -p $pkgdir/usr/{bin,share/scan-s2}
  mv $srcdir/scan-s2/scan-s2 $pkgdir/usr/bin
  mv $srcdir/scan-s2/README $pkgdir/usr/share/scan-s2
  mv $srcdir/scan-s2/{atsc,dvb-*,rotor.conf,TODO,*.pl} $pkgdir/usr/share/scan-s2
 }