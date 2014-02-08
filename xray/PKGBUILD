# Maintainer: Christian Muehlhaeuser <muesli@gmail.com>

pkgname=xray
pkgver=0.0.2
pkgrel=1
pkgdesc="xray compares media files by their perceptual hash and identifies dupes"
arch=('i686' 'x86_64')
url="https://github.com/muesli/xray"
license=('MIT')
depends=('qt5-base' 'phash' 'ffmpeg')
conflicts=('xray-git')
provides=('xray')
source=("https://github.com/muesli/xray/archive/v${pkgver}.tar.gz")
md5sums=('f6dada4ace27de6a9bda4878f467d28d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt5 PREFIX="${pkgdir}/usr" xray.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
}
