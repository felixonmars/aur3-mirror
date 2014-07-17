# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-modelviewer-location-git
pkgver=18.eb9d053
pkgrel=1
pkgdesc="OBJ 3D GPS Modelviewer for libretro GL."
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/modelviewer-location-libretro"
license=('GPL3')
depends=('zlib' 'libgl')
makedepends=('git')

_gitname=modelviewer-location-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/modelviewer_location_libretro.info")
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
  install -Dm644 "${_gitname}/modelviewer_location_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-modelviewer-location.so"
  install -Dm644 "modelviewer_location_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-modelviewer-location.info"
}
