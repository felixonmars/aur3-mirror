# Maintainer: Magnus Therning <magnus@therning.org>

pkgname=gtiles
pkgver=0.2.1
pkgrel=1
pkgdesc="Window tiler for Gnome3."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tab-tile-mutter/"
license=('GPL')
depends=('gtk2')
makedepends=('cmake' 'intltool')
source=(http://downloads.sourceforge.net/project/tab-tile-mutter/gtiles-0.2.1.tar.xz)
install=${pkgname}.install

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    ./configure.user -DCMAKE_INSTALL_PREFIX=/usr
    cd build
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    cd build
    make install DESTDIR=${pkgdir}
}

sha256sums=('17c37edcb5d98c916ab6e0cff5d6a62639222787b40fff9a536f21dc73a593f5')
