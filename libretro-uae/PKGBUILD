# Maintainer: rhon <rhon@free.fr>

pkgname=libretro-uae
pkgver=35.563f257
pkgrel=1
pkgdesc="libretro implementation of UAE (Amiga)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/libretro-uae"
license=('GPL')
makedepends=('git')

_gitname=libretro-uae
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  echo $(pwd)
  cd "${_gitname}/build"
  make -f Makefile
}

package() {
#  install -Dm644 "${_gitname}/desmume/desmume_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-desmume.so"
install -Dm644 "${_gitname}/build/puae_libretro.so" "${pkgdir}/usr/lib/libretro/puae_libretro.so"
}

