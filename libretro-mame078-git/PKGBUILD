# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-mame078-git
pkgver=225.a303302
pkgrel=1
pkgdesc="libretro implementation of MAME 2003 (0.78). (Arcade)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/mame2003-libretro"
license=('custom:MAME License')
depends=('zlib')
makedepends=('git')

_libname=mame078_libretro
_gitname=mame2003-libretro
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
  make # might fail randomly when doing concurrent builds - just try again and it will work eventually
}

package() {
  install -Dm644 "${_gitname}/docs/mame.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
