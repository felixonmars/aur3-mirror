# Maintainer: almostalive <almostalive2003 at gmail dot com>

pkgname=libretro-imame4all-git
_gitname=imame4all-libretro
pkgver=42.474ff5d
pkgrel=1
pkgdesc="libretro implementation of iMAME4all based on MAME 0.37b5. (Arcade)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/imame4all-libretro"
license=('custom:MAME License' 'GPL')
makedepends=('git')
LDFLAGS=''
source=("${_gitname}::git://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -f makefile.libretro #ARM=1 ## If building on ARM device uncomment ARM=1 ##
}

package() {
  install -Dm644 "${_gitname}/res/Applications/iMAME4all.app/LICENSE/LICENSE_MAME.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 "${_gitname}/libretro.so" "${pkgdir}/usr/lib/libretro/libretro-imame4all.so"
}