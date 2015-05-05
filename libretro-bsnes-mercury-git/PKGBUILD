# Maintainer: uberushaximus <uberushaximus AT gmail DOT com>
# Contributor:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-bsnes-mercury-git
pkgver=ccd4994
pkgrel=1
pkgdesc="libretro implementation of bSNES/higan mercury. (Super Nintendo Entertainment System)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/bsnes-mercury"
license=('GPL3')
makedepends=('git')

_gitname=bsnes-mercury
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/bsnes_mercury_accuracy_libretro.info"
        "https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/bsnes_mercury_balanced_libretro.info"
        "https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/bsnes_mercury_performance_libretro.info")

md5sums=('SKIP'
	 'SKIP'
	 'SKIP'
	 'SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${_gitname}"
  git clone . perf
  git clone . balanced

  echo "=== Building bSNES accuracy ==="
  make ui=target-libretro profile=accuracy

  cd "perf"
  echo "=== Building bSNES performance ==="
  make ui=target-libretro profile=performance

  cd "../balanced"
  echo "=== Building bSNES balanced ==="
  make ui=target-libretro profile=balanced
}

package() {
  install -Dm644 "${_gitname}/out/bsnes_mercury_accuracy_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-bsnes-mercury-accuracy.so"
  install -Dm644 "${_gitname}/perf/out/bsnes_mercury_performance_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-bsnes-mercury-performance.so"
  install -Dm644 "${_gitname}/balanced/out/bsnes_mercury_balanced_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-bsnes-mercury-balanced.so"
  install -Dm644 "bsnes_mercury_accuracy_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-bsnes-mercury-accuracy.info"
  install -Dm644 "bsnes_mercury_performance_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-bsnes-mercury-performance.info"
  install -Dm644 "bsnes_mercury_balanced_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-bsnes-mercury-balanced.info"
}
