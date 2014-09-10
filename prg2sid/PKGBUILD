# Maintainer: lobotomius at gmail dot com

pkgname=prg2sid
pkgver=0.91
pkgrel=1
pkgdesc="PRG to SID converter with automatic player identification"
arch=('i686' 'x86_64')
url="http://iancoog.altervista.org/"
license=('unknown')
source=('http://iancoog.altervista.org/C/p2s_091.rar')
noextract=("p2s_091.rar")
md5sums=('d8f3e414285ff8d344162441697651bd')
makedepends=('unrar')

prepare() {
	cd "$srcdir"
	unrar x ../p2s_091.rar
}

build() {
    cd "$srcdir/prg2sid"
    gcc -o prg2sid p2s.c
}

package() {
    cd "$srcdir/prg2sid"
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 prg2sid "$pkgdir/usr/bin"
}
