# Maintainer: Estevao Valadao <estevao@archlinux-br.org>

pkgname=my2cego
pkgver=1.0.2
pkgrel=1
pkgdesc="Import MySQL dump to cego database"
arch=('i686' 'x86_64')
url="http://www.lemke-it.com/"
license=('GPL')
makedepends=('lfc' 'lfcxml' 'cego')
source=(http://www.lemke-it.com/${pkgname}-${pkgver}.tar.gz)
sha1sums=(94b8fcbb4df97a98b2d71026e672b843acbdf953)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

