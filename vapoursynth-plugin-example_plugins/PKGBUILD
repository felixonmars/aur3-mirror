# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=example_plugins
pkgname=vapoursynth-plugin-${_plug}
pkgver=r3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=166147"
license=('GPL')
depends=('vapoursynth')
source=("https://www.dropbox.com/s/updihf3gipg8uhj/VSExamples_${pkgver}.tar.gz")
md5sums=('48e44043401561a83f6780c0a7e87a4c')
options=('!libtool')

prepare() {
  rm -fr "${pkgname}"
  cp -R VSExamples "${pkgname}"

  # Fix Makefile
  cd "${pkgname}"
  sed -e 's|g++-4.7|g++|g' -e 's|dylib|so|g' -e 's|-g|-g -fPIC|g' -i Makefile
}

build() {
  cd "${pkgname}"
  make
}

package(){
  cd "${pkgname}"
  install -Dm755 vsmatrix.so "${pkgdir}/usr/lib/vapoursynth/vsmatrix.so"
  install -Dm755 vsrand.so "${pkgdir}/usr/lib/vapoursynth/vsrand.so"
  install -Dm644 matrix_conversions.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/matrix_conversions.txt"
}
