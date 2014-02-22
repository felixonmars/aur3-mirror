# Maintainer: Dominik Milacher <plic.dmil@gmail.com>
pkgname=libcyra

pkgver=0.2.1beta
_pkgver=0.2.1-beta

pkgrel=1
pkgdesc="A C++ command-line parsing library supporting sub-commands"

arch=('any')
url="https://github.com/milli-961227/libcyra"
license=('unknown')
options=('staticlibs')

source=("https://github.com/milli-961227/libcyra/archive/v0.2.1-beta.tar.gz")
md5sums=('bc943cb4579023d500f7d4862785043c')

build() {
    cd "$srcdir/$pkgname-$_pkgver"
    make
}

package() {
    mkdir -p "$pkgdir/usr/"
    
    cp -r "$srcdir/$pkgname-$_pkgver/include/" "$pkgdir/usr/"
    cp -r "$srcdir/$pkgname-$_pkgver/lib/" "$pkgdir/usr/"
}
