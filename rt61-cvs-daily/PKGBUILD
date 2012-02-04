# $Id: PKGBUILD,v 1.3 2007/09/19 10:08:45 tom Exp $
# Maintainer: Oleg Fajans <ofajans@gmail.com>

pkgname=rt61-cvs-daily
pkgver=21.0
pkgrel=2
pkgdesc="Firmware for the rt2x00 wireless drivers"
arch=(i686 x86_64)
url="http://www.ralinktech.com/ralink/Home/Support/Linux.html"
license=('RALINK')
source=(http://rt2x00.serialmonkey.com/rt61-cvs-daily.tar.gz)

build() {
  cd $startdir/src/rt61-cvs-*/Module
  make
  mkdir -p $startdir/pkg/lib/firmware
  install -m644 rt2* $startdir/pkg/lib/firmware || return 1
}
#the tarball is updated daily, so you will have to manually update the md5 sums. Use the 'md5sum $tarball' command ;-)

md5sums=('4fc571d2f7773627fee66c58549d1305')
