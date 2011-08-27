# Author: mosra <mosra@centrum.cz>
pkgname=kompas-qt
pkgver=0.1.2
pkgrel=1
pkgdesc="Qt GUI for Kompas navigation software"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/kompas.php"
license=('LGPLv3')
makedepends=('cmake')
depends=("kompas-core=$pkgver" 'qt')
conflicts=('kompas-qt-git')
source=("https://github.com/mosra/${pkgname}/tarball/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('bc54dd0080d6475693b200d75d02905c')

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr ../mosra-${pkgname}-53a7b35
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
