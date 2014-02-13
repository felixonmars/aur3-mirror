# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=temporalsoften
pkgname=vapoursynth-${_plug}-git
pkgver=v1.0.0.g36a94c0
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
options=('!libtool')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib/vapoursynth
  make
}

package(){
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"

}
