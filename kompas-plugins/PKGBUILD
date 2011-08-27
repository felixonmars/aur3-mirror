# Author: mosra <mosra@centrum.cz>
pkgname=kompas-plugins
pkgver=0.1.2
pkgrel=1
pkgdesc="Plugins for Kompas navigation software"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/kompas.php"
license=('LGPLv3')
makedepends=('cmake')
depends=("kompas-core=$pkgver")
conflicts=('kompas-plugins-git')
source=("https://github.com/mosra/${pkgname}/tarball/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a299532fb05cedf490f6cf7c3ad4d55b')

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr ../mosra-${pkgname}-0e47a34
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
