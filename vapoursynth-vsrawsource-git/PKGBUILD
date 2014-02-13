# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsrawsource
pkgname=vapoursynth-${_plug}-git
pkgver=20130731.aca5710
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/chikuzen/${_plug}"
license=('LGPL2.1')
depends=('vapoursynth')
provides=("vapoursynth-${_plug}")
conflicts=("vapoursynth-${_plug}" "vapoursynth-plugin-${_plug}")
makedepends=('git')
source=("git+https://github.com/chikuzen/${_plug}.git")
md5sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd "${_gitname}"
  ./configure
  make
}

package(){
  cd "${_gitname}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
