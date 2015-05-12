# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-fmsx-git
pkgver=48.4de0b34
pkgrel=1
pkgdesc="libretro implementation of fMSX. (MSX)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/fmsx-libretro"
license=('unknown')
makedepends=('git')

_libname=fmsx_libretro
_gitname=fmsx-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
