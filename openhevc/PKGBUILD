#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=openhevc
pkgver=20140314.35db8f7
pkgrel=1
pkgdesc="A open HEVC decoder (GIT Version)"
arch=('i686' 'x86_64')
url="https://github.com/OpenHEVC/openHEVC"
license=('LGPL2.1')
depends=('sdl' 'sdl2')
makedepends=('git' 'cmake' 'yasm')
provides=('openhevc')
conflicts=('openhevc')
source=('openhevc::git+https://github.com/OpenHEVC/openHEVC.git')
md5sums=('SKIP')
_gitname=openhevc

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd "${_gitname}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_SKIP_RPATH=ON
}

package() {
  cd "${_gitname}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm755 hevc "${pkgdir}/usr/bin/openhevc"
  install -Dm755 hevc_sdl2 "${pkgdir}/usr/bin/openhevc_sdl2"
}
