# Maintainer: Estevao Valadao <estevao@archlinux-br.org>

pkgname=flimsel
pkgver=0.0.8
pkgrel=1
pkgdesc="A minimalistic image browser"
arch=('i686' 'x86_64')
url="http://www.flpsed.org/flimsel.html"
license=('GPL')
depends=('fltk')
source=(http://www.flpsed.org/${pkgname}-${pkgver}.tar.gz)
sha1sums=(83100410d1d9e2180f04dd1abfc19a150906b92c)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -i DESTDIR="${pkgdir}" install
}

