# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-vbam-git
pkgver=1169.c0449e2
pkgrel=1
pkgdesc="libretro implementation of VBA-M. (Game Boy Advance)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/vbam-libretro"
license=('GPL')
makedepends=('git')

_libname=vbam_libretro
_gitname=vbam-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}/src/libretro"
  make
}

package() {
  install -Dm644 "${_gitname}/src/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
