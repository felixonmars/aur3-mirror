# Author: Diego Essaya <dessaya@fi.uba.ar>
# Author: Emiliano Castagnari (aka Torian) <ecastag@fi.uba.ar>
# Maintainer: Yu-Fu Wu <wennynnewenny@gmail.com>

pkgname=gems
pkgver=1.1.1
pkgrel=1
pkgdesc="The gems system is a client/server application that allows one to show a single console session in different computers or terminals in real time. "
arch=('any')
url="http://gforge.lug.fi.uba.ar/projects/gemsd/"
license=(GPL)
# because the homepage can not be reached, so grab source from debian.
source=(http://ftp.de.debian.org/debian/pool/main/g/gems/$pkgname"_"$pkgver.orig.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver/
  sed -i 's/lock/tmp/' server/source/defaults.h
  make PREFIX=/usr MANPATH=/usr/share/man
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make PREFIX=/usr MANPATH=$pkgdir/usr/share/man DESTDIR=$pkgdir install
}

md5sums=('1b4eb9b19c7c7bb570721354ffde74f7')
# vim:set ts=2 sw=2 et:
