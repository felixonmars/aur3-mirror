# Maintainer: Cory Giles <mail@corygil.es>

pkgname=libbeato-git
pkgver=20140828
pkgrel=1
epoch=
pkgdesc="NGS C library."
arch=('i686' 'x86_64')
url="https://github.com/CRG-Barcelona/libbeato"
license=('GPL')
makedepends=('git')
provides=('libbeato')
options=('staticlibs')

build() {
    cd "$srcdir"
    if [[ -d "libbeato" ]]; then
        cd libbeato && git pull origin
    else
        git clone https://github.com/CRG-Barcelona/libbeato.git
    fi
    cd "$srcdir"/libbeato
    ./configure --prefix=/usr \
        CFLAGS="-g -O3 -I/usr/include" \
        LDFLAGS=-L/usr/lib
    make -j
}

package() {
    cd "$srcdir/libbeato"
    make DESTDIR="$pkgdir/" install
}
