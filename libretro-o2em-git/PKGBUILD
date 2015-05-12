# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-o2em-git
pkgver=44.0c4eebb
pkgrel=1
pkgdesc="libretro implementation of O2EM. (Magnavox Odyssey 2/VideoPac)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/libretro-o2em"
license=('custom:Artistic License')
makedepends=('git')

_libname=o2em_libretro
_gitname=libretro-o2em
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
