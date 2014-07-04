# Maintainer: lobotomius at gmail dot com

pkgname=unp64
pkgver=2.31
pkgrel=1
pkgdesc="Generic C64 prg unpacker, original idea and code from Exomizer by Magnus Lind"
arch=('i686' 'x86_64')
url="http://iancoog.altervista.org/"
license=('custom')
makedepends=()
source=("http://iancoog.altervista.org/C/unp64_231.7z")
md5sums=('af1cb34b47220607196144bfb78af711')

build() {
    cd "$srcdir/unp64_230/src"
    make

}

package() {
    cd "$srcdir/unp64_230/src"
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 "Release/unp64" "$pkgdir/usr/bin"

}


