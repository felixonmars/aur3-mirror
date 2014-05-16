# Maintainer: Ricardo Band <me@xengi.de>
pkgname=hh
pkgver=1.12
pkgrel=1
pkgdesc="A command line utility that brings improved BASH command completion from the history. It aims to make completion easier and more efficient than Ctrl-r."
arch=('any')
url="https://github.com/dvorka/hstr"
license=('Apache')
makedepends=('readline' 'ncurses')
source=(https://github.com/dvorka/hstr/releases/download/$pkgver/$pkgname-$pkgver-src.tgz)
sha256sums=('6d7391175245c7802874cac01d840cc8d3ee94fc7a72b9f684dd90c29e972e1e')

build() {
    cd "$srcdir/hstr"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/hstr"
    make DESTDIR="$pkgdir/" install
}
