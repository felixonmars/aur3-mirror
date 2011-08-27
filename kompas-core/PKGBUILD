# Author: mosra <mosra@centrum.cz>
pkgname=kompas-core
pkgver=0.1.2
pkgrel=1
pkgdesc="Core library for Kompas navigation software"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/kompas.php"
license=('LGPLv3')
makedepends=('cmake')
conflicts=('kompas-core-git')
source=("https://github.com/mosra/${pkgname}/tarball/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('5327be51e8f3dccd16b45d9e500b0ba6')

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr ../mosra-${pkgname}-6f5eaea
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
