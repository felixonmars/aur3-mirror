# Maintainer:  mac1202
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=beetle-psx-libretro-git
pkgver=595.9efed9e
pkgrel=1
pkgdesc="Standalone port of Mednafen PSX to libretro."
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/beetle-psx-libretro"
license=('GPL')
makedepends=('git')
conflicts=('libretro-mednafen-psx-git')

_gitname=beetle-psx-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/mednafen_psx_libretro.info")
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
  install -Dm644 "${_gitname}/mednafen_psx_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-mednafen-psx.so"
  install -Dm644 "mednafen_psx_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-mednafen-psx.info"
}
