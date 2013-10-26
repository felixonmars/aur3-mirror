# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fieldhint
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth')
source=("https://github.com/dubhater/vapoursynth-${_plug}/archive/v${pkgver}.tar.gz")
md5sums=('4af9dd215205d5ef1a2fd681e2961e03')

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
