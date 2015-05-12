# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-bnes-git
pkgver=27.731aa93
pkgrel=1
pkgdesc="libretro implementation of bnes/higan. (Nintendo Entertainment System)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/bnes-libretro"
license=('GPL3')
makedepends=('git')

_libname=bnes_libretro
_gitname=bnes-libretro
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
