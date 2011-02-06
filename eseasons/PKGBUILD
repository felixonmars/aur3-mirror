# Maintainer: Kosava <kosava@archlinux.us>

pkgname=eseasons
pkgver=0.1.2
pkgrel=1
pkgdesc="eSeasons is a simple tool to manage TV-shows"
arch=('i686' 'x86_64')
url="https://launchpad.net/eseasons"
license=('GPL3')
depends=('gtk2' 'sqlite3')
makedepends=('vala-devel')
conflicts=('eseasons-bzr')
source=(http://launchpad.net/${pkgname}/trunk/0.1/+download/${pkgname}-${pkgver}.tar.gz)
md5sums=('e0ca01d1390a883a4ff2503e999de17a')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
     make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
