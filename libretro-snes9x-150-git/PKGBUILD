# Maintainer:  Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-snes9x-150-git
pkgver=7.32e21ff
pkgrel=1
pkgdesc="libretro implementation of SNES9x-150. (Super Nintendo Entertainment System)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/snes9x-150"
license=('custom')
makedepends=('git')

_gitname=snes9x-150
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/snes9x_libretro.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  make
}

package() {
  install -Dm644 "${_gitname}/libretro.so" "${pkgdir}/usr/lib/libretro/libretro-snes9x-150.so"
  install -Dm644 "snes9x_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-snes9x-150.info"
}
