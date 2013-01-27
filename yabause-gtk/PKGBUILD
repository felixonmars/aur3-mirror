# Maintainer : Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anton Shestakov <engored*ya.ru>
# Contributor: Tiago Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=yabause-gtk
_name=yabause
pkgver=0.9.12
pkgrel=1
pkgdesc='A Sega Saturn emulator with GTK interface'
url='http://yabause.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('freeglut' 'gtkglext' 'sdl' 'openal' 'mini18n-git')
makedepends=('cmake' 'mesa')
conflicts=('yabause')
provides=('yabause')
source=("http://downloads.sourceforge.net/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('c7876c04489f8a1b59b3166598084cb8')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  [ -e build ] && rm -rf build
  mkdir build

  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DYAB_PORTS=gtk \
    -DYAB_MULTIBUILD=OFF \
    -DYAB_NETWORK=ON \
    -DYAB_OPTIMIZED_DMA=on \
    -DYAB_PERKEYNAME=ON \
    ..
  make
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}
