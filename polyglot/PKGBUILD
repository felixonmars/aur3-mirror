# Maintainer: Milos Pejovic <pejovic@gmail.com>
# Contributor: Auguste <auguste@gmail.com>

pkgname=polyglot
pkgver=1.4.70b
pkgrel=1
pkgdesc="A UCI adapter to connect a UCI chess engine to an xboard interface."
arch=('i686' 'x86_64')
url="http://hardy.uhasselt.be/Toga/"
license=('GPLv2')
source=(http://hardy.uhasselt.be/Toga/polyglot-release/polyglot-${pkgver}.tar.gz)
md5sums=('a2dfc9f1edfa5896dbd9ca49c60d3f57')

build() {
    cd $srcdir/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install || return 1
}
