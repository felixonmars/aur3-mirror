# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-mednafen-vb-git
pkgver=534.6a9a6eb
pkgrel=1
pkgdesc="libretro implementation of Mednafen VB. (Virtual Boy)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/beetle-vb-libretro"
license=('GPL')
makedepends=('git')

_libname=mednafen_vb_libretro
_gitname=beetle-vb-libretro
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
