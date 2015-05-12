# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-tyrquake-git
pkgver=1395.a08c03f
pkgrel=1
pkgdesc="libretro implementation of TyrQuake. (Quake)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/tyrquake"
license=('GPL')
makedepends=('git')

_libname=tyrquake_libretro
_gitname=tyrquake
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
  make -f Makefile
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
