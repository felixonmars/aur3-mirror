# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: lifning <definelightning@gmail.com>

pkgname=libretro-tgbdual-git
pkgver=57.ea1364c
pkgrel=1
pkgdesc="libretro implementation of TGB Dual. (Game Boy/Game Boy Color)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="http://github.com/libretro/tgbdual-libretro"
license=('GPL')
makedepends=('git')

_libname=tgbdual_libretro
_gitname=tgbdual-libretro
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
