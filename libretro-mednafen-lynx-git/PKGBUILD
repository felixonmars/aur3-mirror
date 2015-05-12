# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-mednafen-lynx-git
pkgver=531.54b9a6e
pkgrel=1
pkgdesc="libretro implementation of Mednafen Lynx. (Atari Lynx)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/beetle-lynx-libretro"
license=('zlib')
makedepends=('git')

_libname=mednafen_lynx_libretro
_gitname=beetle-lynx-libretro
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