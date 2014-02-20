# Contributor: Matteo Agostinelli <matteo@agostinelli.me>
pkgname=kdab-charm
pkgver=1.8.0
pkgrel=1
pkgdesc="Charm is a program that helps to keep track of time"
arch=('x86_64' 'i686')
url="https://github.com/KDAB/Charm"
license=('GPL')
makedepends=('gcc' 'cmake' 'qt4')
depends=('qt4' 'hicolor-icon-theme')
install='kdab-charm.install'
source=(https://github.com/KDAB/Charm/tarball/$pkgver)
md5sums=('9bfc36e02ebdb562289af9aecb264416')

build() {
    cd "$srcdir/KDAB-Charm-66f03ca"

    rm -rf build
    mkdir  build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCharm_VERSION=$pkgver
    make 
}

package() {
    cd "$srcdir/KDAB-Charm-66f03ca/build"
    make DESTDIR=$pkgdir install
}
