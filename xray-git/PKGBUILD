# Maintainer: Christian Muehlhaeuser <muesli@gmail.com>

pkgname=xray-git
pkgver=24.491cd54
pkgrel=1
pkgdesc="xray compares media files by their perceptual hash and identifies dupes"
arch=('i686' 'x86_64')
url="https://github.com/muesli/xray"
license=('MIT')
depends=('qt5-base' 'phash' 'ffmpeg')
makedepends=('git')
conflicts=('xray')
provides=('xray')
source=('git+https://github.com/muesli/xray.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/xray"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/xray"
  qmake-qt5 PREFIX="${pkgdir}/usr" xray.pro
  make
}

package() {
  cd "${srcdir}/xray"
  make install
}
