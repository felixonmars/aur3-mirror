# Maintainer: Cory Giles <mail@corygil.es>

pkgname=bwtool-git
pkgver=20140828
pkgrel=1
epoch=
pkgdesc="CLI utilities for manipulating BigWig files."
arch=('i686' 'x86_64')
url="https://github.com/CRG-Barcelona/bwtool"
license=('GPL')
makedepends=('git')
depends=('libbeato')

build() {
	cd "$srcdir"
   if [[ -d "bwtool" ]]; then
        cd bwtool && git pull origin
    else
        git clone https://github.com/CRG-Barcelona/bwtool.git
    fi
    cd "$srcdir"/bwtool
	./configure --prefix=/usr CFLAGS="-g -O3 -I/usr/include" LDFLAGS=-L/usr/lib
	make -j
}

package() {
	cd "$srcdir/bwtool"
	make DESTDIR="$pkgdir/" install
}
