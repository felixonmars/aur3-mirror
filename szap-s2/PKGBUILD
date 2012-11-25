# Maintainer: Romain Schmitz <slopjong at archlinux dot lu>

pkgname=szap-s2
pkgver=20121125
pkgrel=1
pkgdesc="Simple zapping tool for the Linux DVB S2 API"
arch=('i686' 'x86_64')
url="https://pikacode.com/liplianin/szap-s2/"
license=('GPL')
depends=('linux-api-headers')
source=('http://slopjong.de/wp-content/2012/11/szap-s2.tar.bz2')
md5sums=('874d8d975b4a61ba2b4053c2c4250cb2')

build() {
  cd $srcdir/szap-s2
  make
 }
 
 package() {
  mkdir -p $pkgdir/usr/{bin,share/szap-s2}
  mv $srcdir/szap-s2/szap-s2 $pkgdir/usr/bin
  mv $srcdir/szap-s2/README $pkgdir/usr/share/szap-s2
 }