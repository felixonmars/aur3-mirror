# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=ssiq
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth')
source=("https://github.com/dubhater/vapoursynth-${_plug}/archive/v${pkgver}.tar.gz")
md5sums=('668ba41c82751279a0affe2302323b4b')

prepare() {
  rm -fr build
  cp -R "vapoursynth-${_plug}-${pkgver}" build
}

build() {
  cd build
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib/vapoursynth
  make
}

package(){
  cd build
  make install DESTDIR="$pkgdir"
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
