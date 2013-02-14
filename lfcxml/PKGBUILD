# Maintainer: Fat Cat <carlos dot manuel250 at gmail dot com>
# Contributor: Estevao Valadao <estevao@archlinux-br.org>

pkgname=lfcxml
pkgver=1.0.27
pkgrel=1
pkgdesc="C++ XML library"
arch=('i686' 'x86_64')
url="http://www.lemke-it.com/"
license=('GPL')
depends=('lfc')
source=(http://www.lemke-it.com/${pkgname}-${pkgver}.tar.gz)

sha256sums=('f0fd9ef8329b183e3a3ed5a926261768b48aec7b99457f56dddf10e47a6f5f01')
sha512sums=('786917c1e971a4bd83b84f239451073c1ccb34a3c0c8104fbe0ce5895d7c17a16f92a9278455ea3c02e242558f406afa3e877ae7866d9007e5fc8a5fae7c3940')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
