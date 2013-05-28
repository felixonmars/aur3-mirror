# Maintainer: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=kpassgen
pkgver=1.4
pkgrel=2
pkgdesc="Random password generator"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/KPassGen?content=108673"
license=('GPL2')
depends=('kdelibs')
makedepends=('automoc4' 'cmake')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('92cd2cb20623fd18b036a758abb25f0b06ac80a45b0b99dc903505d6e6aa8271')

build() {
    cd "${srcdir}"/$pkgname
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
    make
}

package() {
    cd "${srcdir}"/$pkgname
    make DESTDIR="$pkgdir" install
}
