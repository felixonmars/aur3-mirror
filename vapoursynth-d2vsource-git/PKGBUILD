# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=d2vsource
pkgname=vapoursynth-${_plug}-git
pkgver=beta7.0.g9585903
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/dwbuiten/${_plug}"
license=('LGPL2.1')
depends=('vapoursynth')
provides=("vapoursynth-${_plug}")
conflicts=("vapoursynth-${_plug}" "vapoursynth-plugin-${_plug}")
makedepends=('git')
source=("git+https://github.com/dwbuiten/${_plug}.git")
md5sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_gitname}"
  ./configure --install="${pkgdir}/usr/lib/vapoursynth"
  make
}

package(){
  cd "${_gitname}"
  make install
  install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}

