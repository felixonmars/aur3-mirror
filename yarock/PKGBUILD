# Maintainer: Košava <kosava@archlinux.us>
pkgname=yarock
pkgver=1.1.2
pkgrel=1
pkgdesc="Yarock is Qt4 Modern Music Player with collection browser based on cover art."
arch=('i686' 'x86_64')
url="https://launchpad.net/yarock"
license=('GPL3')
makedepends=('cmake' 'automoc4')
depends=('qt4' 'taglib' 'phonon' 'qjson')
source=(https://launchpad.net/yarock/1.x/${pkgver}/+download/Yarock_${pkgver}_source.tar.gz)
md5sums=('88733d9bed252c132a378dfecb158697')
build() {
mkdir build
cd build
cmake ../Yarock_${pkgver}_source \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr
make
}

package() {
cd build
make DESTDIR="${pkgdir}" install
} 