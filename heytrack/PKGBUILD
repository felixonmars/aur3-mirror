# Author: mosra <mosra@centrum.cz>
pkgname=heytrack
pkgver=0.99.71
pkgrel=1
pkgdesc="Simple utility for playing internet radio streams with track notification"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/heytrack-en.php"
license=('LGPLv3')
groups=()
depends=('qt' 'qjson')
makedepends=('cmake')
conflicts=('heytrack-git')
source=("http://github.com/mosra/${pkgname}/tarball/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('fcc72c76c1879078541cd975e7a67107')

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr ../mosra-${pkgname}-*
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
