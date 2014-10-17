# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

_plug=scenechange
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.2.0.0.g14ede18
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=166769'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/alucryd/vapoursynth-${_plug}.git")
sha256sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"
  ./configure --install="${pkgdir}/usr/lib/vapoursynth"
  make
}

package(){
  cd "${_plug}"
  make install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}

