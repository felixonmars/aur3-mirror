# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=glosm-git
pkgver=372.a447690
pkgrel=1
pkgdesc='3D OpenStreetMap renderer'
arch=('i686' 'x86_64')
url='http://glosm.amdmi3.ru/about.html'
license=('AGPL3')
depends=('expat' 'sdl' 'libgl')
makedepends=('git' 'cmake')
provides=('glosm=0.0.4')
conflicts=('glosm')

source=('git+https://github.com/AMDmi3/glosm')
md5sums=('SKIP')

pkgver() {
  cd 'glosm'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd 'glosm'
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd 'glosm/build'
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sts=2 sw=2 et:
