# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-meteor-git
pkgver=125.b4e749b
pkgrel=1
pkgdesc="libretro implementation of Meteor. (Game Boy Advance)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/meteor-libretro"
license=('GPL3')
makedepends=('git')

_libname=meteor_libretro
_gitname=meteor-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}/libretro
  make
}

package() {
  install -Dm644 "${_gitname}/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
