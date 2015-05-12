# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-mednafen-wswan-git
pkgver=538.9187162
pkgrel=1
pkgdesc="libretro implementation of Mednafen Cygne. (WonderSwan/WonderSwan Color)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/beetle-wswan-libretro"
license=('GPL')
makedepends=('git')

_libname=mednafen_wswan_libretro
_gitname=beetle-wswan-libretro
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
