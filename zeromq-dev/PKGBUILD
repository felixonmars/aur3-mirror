# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=zeromq-dev
pkgver=3.2.0
pkgrel=1
pkgdesc="The development version of ØMQ, a fast messaging library."
url="http://zeromq.org"
license=("LGPL")
source=("http://download.zeromq.org/zeromq-${pkgver}-rc1.tar.gz")
md5sums=("e700b4d447ca6c159ae5c12e357f7d72")
arch=("i686" "x86_64")
depends=()
makedepends=("autoconf" "make" "gcc")
provides=("zeromq")
conflicts=("zeromq")

build() {
    cd "$srcdir"/zeromq-$pkgver
    ./configure prefix="$startdir/pkg/usr"
    make
    make install
}
