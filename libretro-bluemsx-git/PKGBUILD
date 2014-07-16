# Maintainer: uberushaximus <uberushaximus AT gmail DOT com>

pkgname=libretro-bluemsx-git
pkgver=584b571
pkgrel=1
pkgdesc="libretro implementation of blueMSX (MSX)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/blueMSX-libretro"
license=(custom BSD GPL zlib)
makedepends=('git')

_gitname=blueMSX-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/bluemsx_libretro.info"
        "https://raw.githubusercontent.com/libretro/${_gitname}/master/license.txt")

md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${_gitname}"
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/bluemsx_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-bluemsx.so"
  install -Dm644 "bluemsx_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-bluemsx.info"
  install -Dm644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
