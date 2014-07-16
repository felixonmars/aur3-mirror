# Maintainer: uberushaximus <uberushaximus AT gmail DOT com>

pkgname=libretro-remotejoy-git
pkgver=24.70da4b2
pkgrel=1
pkgdesc="RemoteJoy client side code rewritten for libretro."
arch=('any')
url="https://github.com/libretro/libretro-remotejoy"
license=('GPL')
makedepends=('git')

_gitname=libretro-remotejoy
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/remotejoy_libretro.info")
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
  install -Dm644 "${_gitname}/remotejoy_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-remotejoy.so"
  install -Dm644 "remotejoy_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-remotejoy.info"
}

