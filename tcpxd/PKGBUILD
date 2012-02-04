# Maintainer: Pierre Bourdon <delroth@gmail.com>

pkgname=tcpxd
pkgver=1.4
pkgrel=1
pkgdesc="a general purpose TCP/IP relay program designed to be simple to get going"
arch=(i686 x86_64)
url="http://quozl.netrek.org/tcpxd/"
license=(GPL2)
depends=(glibc)
source=(http://quozl.netrek.org/tcpxd/${pkgname}-${pkgver}.tar.gz)

build() {
     cd $srcdir/$pkgname-$pkgver
     ./configure --prefix=/usr
     make || return 1
     make DESTDIR=$pkgdir install
}

md5sums=('d0b48ccf8fbb68bbcc5280b3dbc63a70')
