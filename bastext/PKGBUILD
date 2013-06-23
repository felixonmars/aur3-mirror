# Maintainer: lobotomius at gmail dot com

pkgname=bastext
pkgver=1.06
archive_file='BasText-1.06.rar'
pkgrel=1
pkgdesc="Basic to TXT detokenizer modified by Ian Coog"
arch=('i686' 'x86_64')
url="http://iancoog.altervista.org/"
license=('GPL')
source=('http://iancoog.altervista.org/C/BasText-1.06.rar' 'bastext.patch')
md5sums=('c69cafe3ebecb325b271154df02a72a2' '9b876128afcc6819dc75a2b57dc8f36c')
makedepends=('unrar')
noextract=($archive_file)

prepare() {
	cd "$srcdir"
	unrar x -o+ "../$archive_file"
	patch -p1 < bastext.patch
}

build() {
    cd "$srcdir"
    make -f makefile.gcc bastext
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 bastext "$pkgdir/usr/bin"
}
