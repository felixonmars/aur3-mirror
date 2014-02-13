# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=scxvid
pkgname=vapoursynth-${_plug}-git
pkgver=20121203.a805582
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth')
provides=("vapoursynth-${_plug}")
conflicts=("vapoursynth-${_plug}" "vapoursynth-plugin-${_plug}")
makedepends=('git')
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
md5sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
  cd "${_gitname}"
  echo "all:
	  gcc -shared -fPIC -O2 -march=native -o lib${_plug}.so ${_plug}.c -lxvidcore" > Makefile
}

build() {
  cd "${_gitname}"
  make
}

package(){
  cd "${_gitname}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
