# Maintainer: Jan Dlabal <dlabaljan at gmail dot com>
pkgname=quickshare
pkgver=1.0
pkgrel=1
pkgdesc="A program allowing for quick, simple sharing of files over your LAN, WiFi, etc., using the HTTP protocol"
arch=('i686' 'x86_64')
url="http://houbysoft.com/qs/"
license=('GPL3')
depends=('libmicrohttpd' 'gtk2')
source=("http://houbysoft.com/download/$pkgname-$pkgver-src.tar.gz")
md5sums=('5f53945f84dfbb8a0c512901296a1592')

build() {
  cd  $srcdir/$pkgname-$pkgver-src
  make || return 1
  install -D qs "$pkgdir/usr/bin/qs"
}

