# Maintainer: Estevao Valadao <estevao@archlinux-br.org>

pkgname=cego
pkgver=2.11.0
pkgrel=1
pkgdesc="A relational and transactional database system"
arch=('i686' 'x86_64')
url="http://www.lemke-it.com/"
license=('GPL')
makedepends=('lfc' 'lfcxml')
source=(http://www.lemke-it.com/${pkgname}-${pkgver}.tar.gz)
sha1sums=(203e06081db5dbc461c2310846809324e5aea261)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make -i DESTDIR="${pkgdir}" install
    install -m 755 tools/cgmkdb "$pkgdir/usr/bin/cgmkdb"
    install -m 755 tools/cgmkdb "$pkgdir/usr/bin/cgbackup"
    install -m 755 tools/cgmkdb "$pkgdir/usr/bin/cgrecover"
}

