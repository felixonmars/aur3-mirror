# Maintainer: mickael9 <mickael9 at gmail dot com>

pkgname=multircon
pkgver=0.2.3d
pkgrel=1
pkgdesc='a tool for sending RCON commands to servers which use different engines and support RCON (remote administration)'
arch=(i686 x86_64)
url='http://aluigi.altervista.org/papers.htm'
license=(GPL)
depends=(glibc)
makedepends=(gcc)
source=(http://aluigi.altervista.org/papers/multircon.zip)
md5sums=('db9190acd342cd156e507d0233a9e8bc')

build() {
    mkdir -p $pkgdir/usr/bin
    cd $srcdir
    gcc $CFLAGS *.c -o $pkgdir/usr/bin/$pkgname -lpthread
}
