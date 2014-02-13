# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=GenericFilters
_plug_lowcase=genericfilters
pkgname=vapoursynth-${_plug_lowcase}-git
pkgver=20131205.95bc18a
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/myrsloik/${_plug}"
license=('LGPL2.1')
depends=('vapoursynth')
provides=("vapoursynth-${_plug_lowcase}")
conflicts=("vapoursynth-${_plug_lowcase}" "vapoursynth-plugin-${_plug_lowcase}")
makedepends=('git')
source=("git+https://github.com/myrsloik/${_plug}.git")
md5sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd "${_gitname}/src"
  ./configure --install="${pkgdir}/usr/lib/vapoursynth"
  make
}

package(){
  cd "${_gitname}/src"
  make install
  install -Dm644 ../readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
