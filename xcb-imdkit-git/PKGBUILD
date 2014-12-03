# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=xcb-imdkit-git
pkgver=r44.916f510
pkgrel=1
pkgdesc="Input method development support for xcb"
arch=('i686' 'x86_64')
url="https://github.com/wengxt/xcb-imdkit"
license=('LGPL')
depends=('xcb-util-keysyms' 'xcb-util')
makedepends=('cmake')
source=("git+https://github.com/wengxt/xcb-imdkit.git")
md5sums=('SKIP')

pkgver() {
  cd xcb-imdkit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd xcb-imdkit

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd xcb-imdkit
  make install DESTDIR="${pkgdir}"
}

