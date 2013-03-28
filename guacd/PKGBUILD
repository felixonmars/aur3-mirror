# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>
pkgname=guacd
pkgver=0.7.0
pkgrel=2
pkgdesc="Daemon for the Guacamole web application"
arch=('i686' 'x86_64')
url="http://guacamole.sourceforge.net"
license=('GPL3')
depends=('libguac')
makedepends=()
optdepends=()
provides=()
source=(http://sourceforge.net/projects/guacamole/files/current/source/$pkgname-$pkgver.tar.gz
        guacd.service)
md5sums=('88dd79137076605ebc46911fbee21c87'
         '23cacc349e83283c4a0a1ba0e17e5302')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 $srcdir/$pkgname.service $pkgdir/lib/systemd/system/$pkgname.service
}

# vim:set ts=2 sw=2 et:
