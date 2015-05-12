# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-fba-cps2-git
pkgver=798.7e70ddf
pkgrel=1
pkgdesc="libretro implementation of Final Burn Alpha's CPS2 core (FBA). (CP System II)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/fba-libretro"
license=('custom:FB Alpha License')
makedepends=('git')

_libname=fba_cores_cps2_libretro
_gitname=fba-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}/svn-current/trunk/fbacores/cps2"
  make -f makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/svn-current/trunk/src/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 "${_gitname}/svn-current/trunk/fbacores/cps2/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
