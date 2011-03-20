# Author: mosra <mosra@centrum.cz>
pkgname=kompas-plugins-nonfree
pkgver=0.1.2
pkgrel=1
pkgdesc="Non-free plugins for Kompas navigation software"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/kompas.php"
license=('LGPLv3')
makedepends=('cmake')
depends=("kompas-core=$pkgver" "kompas-plugins=$pkgver")
conflicts=('kompas-plugins-nonfree-git')
source=("https://github.com/mosra/${pkgname}/tarball/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a5c9abe3deb55107b2462f8d6e34c642')

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr ../mosra-${pkgname}-fca0b11
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
