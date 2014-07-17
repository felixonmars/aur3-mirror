# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-modelviewer-git
pkgver=90.84f7b0f
pkgrel=1
pkgdesc="OBJ 3D Modelviewer for libretro GL."
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/modelviewer-libretro"
license=('GPL3')
depends=('zlib' 'libgl')
makedepends=('git')

_gitname=modelviewer-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/modelviewer_libretro.info")
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
  install -Dm644 "${_gitname}/modelviewer_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-modelviewer.so"
  install -Dm644 "modelviewer_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-modelviewer.info"
}
