# Maintainer: Harley Laue <losinggeneration@gmail.com>
# Contributer: agapito <agapitofrndez@ozu.es>

pkgname=yabause-qt
_pkgname=yabause
pkgver=0.9.12
pkgrel=3
pkgdesc='A Sega Saturn emulator with QT interface.'
url='http://yabause.org/'
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('cmake')
depends=('sdl' 'qt' 'openal' 'mesa' 'glu')
conflicts=('yabause')
provides=('yabause')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('c7876c04489f8a1b59b3166598084cb8')

build() {
  msg "This package is deprecated. Please use yabause instead."
  exit 1
  cd "${srcdir}/${_pkgname}-${pkgver}"

  [ -e build ] && rm -rf build
  mkdir build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DYAB_PORTS=qt \
    -DYAB_MULTIBUILD=OFF \
    -DYAB_NETWORK=ON \
    -DYAB_OPTIMIZED_DMA=on \
    -DYAB_PERKEYNAME=ON \
    ..

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
