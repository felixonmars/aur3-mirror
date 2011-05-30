# Maintainer: Lee Zher Huei <lee.zh.92@gmail.com>

pkgname=(flying-penguin)
pkgver=0.2
pkgrel=1
pkgdesc="An arcade game involving a penguin, strap-on wings and flying fish"
arch=('i686' 'x86_64')
url="http://leezh.net/"
license=('GPL')
depends=('sfml>=1.6' 'physfs')
makedepends=(cmake)
source=(http://releases.leezh.net/flying-penguin/flying-penguin-$pkgver.tar.gz)
md5sums=('f526a6bff56d9c086bc33b8ef9b2f6e6')

build() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
