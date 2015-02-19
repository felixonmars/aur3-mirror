# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=continuity_fixer-16bits
pkgname=vapoursynth-plugin-${_plug}
pkgver=r3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=171785"
license=('GPL')
depends=('vapoursynth')
conflicts=('vapoursynth-plugin-continuity_fixer')
source=("${_plug}-${pkgver}.c::http://pastebin.com/raw.php?i=DXJcTU0R")
sha1sums=('a0c058f9f6318c21fd22345d7d549d649230ff90')

prepare() {
    echo "all:
	  gcc -shared ${CFLAGS} -msse2 -mfpmath=sse -Wall -fPIC -o lib${_plug}.so ${_plug}-${pkgver}.c -I. $(pkg-config --cflags vapoursynth)" > Makefile
}

build() {
  make
}

package(){
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
