# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsimagereader
pkgname=vapoursynth-${_plug}-git
pkgver=20131127.fd15124
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/myrsloik/${_plug}"
license=('LGPL2.1')
depends=('vapoursynth' 'libpng' 'libjpeg-turbo')
provides=("vapoursynth-${_plug}")
conflicts=("vapoursynth-${_plug}" "vapoursynth-plugin-${_plug}")
makedepends=('git')
source=("git+https://github.com/myrsloik/${_plug}.git")
md5sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare(){
  cd "${_gitname}/src"
  chmod +x configure
}

build() {
  cd "${_gitname}/src"
  ./configure --enable-new-png
  make
}

package(){
  cd "${_gitname}"
  install -Dm755 "src/lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
