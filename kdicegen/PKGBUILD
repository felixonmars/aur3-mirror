# Maintainer: Michael Daffin <james1479 at gmail.com>

pkgname=kdicegen
pkgver=1.9.4
pkgrel=1
pkgdesc="A scriptable dungeon and dragons style dice roller"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/kdicegen"
license=('GPL2')
depends=('qt')
makedepends=('automoc4')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname-$pkgver.tar.gz")

build() {
    cd ${srcdir}/${pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
    make
}

package() {
    cd ${srcdir}/${pkgname}
    make DESTDIR=${pkgdir} install
}

md5sums=('51a7f9d38bbee9642d46ed5a260ffece')
