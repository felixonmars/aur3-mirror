# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-sayura
pkgver=0.1.0
pkgrel=1
pkgdesc="Sinhala Transe IME engine for fcitx."
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-sayura"
license=('GPL')
depends=('fcitx>=4.2.6')
makedepends=('cmake' 'intltool')
source=(http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz)
md5sums=('66c3a797cdc1f5a5ae19690cc8fd7cbd')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}

  rm -rf build
  mkdir build
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
