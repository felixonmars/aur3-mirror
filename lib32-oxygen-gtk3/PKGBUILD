# Maintainer: Jens Staal <staal1978@gmail.com>
# adapted from lib32-oxygen-gtk2 and the official oxygen-gtk3

_pkgbasename=oxygen-gtk3
pkgname=lib32-${_pkgbasename}
pkgver=1.3.3
pkgrel=1
pkgdesc="Port of the default KDE widget theme (Oxygen) to GTK3"
arch=('x86_64')
url="https://projects.kde.org/projects/playground/artwork/oxygen-gtk/"
license=('LGPL')
depends=('lib32-gtk3' "${_pkgbasename}")
makedepends=('cmake' 'gcc-multilib')
source=("http://download.kde.org/stable/${_pkgbasename}/${pkgver}/src/${_pkgbasename}-${pkgver}.tar.bz2")
md5sums=('c849ca9ef925b2d967538b1b83b6e72a')

prepare() {
  mkdir build
}

build() {
  cd build

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake ../${_pkgbasename}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_SUFFIX=32
  make
}

package() {
  cd build
  make DESTDIR=${pkgdir} install

  # Clean up directories provided by x86_64 package
  rm -rf ${pkgdir}/usr/bin
  rm -rf ${pkgdir}/usr/share
} 
