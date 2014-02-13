# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>

_plug=temporalsoften2
pkgname=vapoursynth-${_plug}-git
pkgver=v0.1.1.0.g7c72c4d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=166769'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-${_plug}")
conflicts=("vapoursynth-${_plug}")
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
  install -Dm644 temporalsoften2.py "${pkgdir}/usr/lib/python3.3/site-packages/temporalsoften2.py"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}

