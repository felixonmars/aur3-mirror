# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fmtconv_wrapper
pkgname=vapoursynth-plugin-${_plug}
pkgver=r7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=170633"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
source=("${_plug}::git+https://gist.github.com/c250a0dfefbfb113e925.git")
md5sums=('SKIP')

pkgver() {
  cd "${_plug}"
  printf "r%s" "$(git rev-list --count HEAD)"
}

prepare() {
  cd "${_plug}"
  rm -f "lib${_plug}.so"
}

build() {
  cd "${_plug}"
  echo "all:
	  gcc -o lib${_plug}.so -std=c99 -fPIC -shared -O2 -Wall -Wextra -Wno-unused-parameter $(pkg-config --cflags vapoursynth) fmtcwrap.c" > Makefile
  make
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.txt"
}
