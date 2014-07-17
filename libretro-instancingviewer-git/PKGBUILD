# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-instancingviewer-git
pkgver=74.a8e8de6
pkgrel=1
pkgdesc="PNG image InstancingViewer for libretro GL."
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/instancingviewer-libretro-gl"
license=('GPL3')
depends=('zlib' 'libgl')
makedepends=('git')

_gitname=instancingviewer-libretro-gl
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/instancingviewer_libretro.info")
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
  install -Dm644 "${_gitname}/instancingviewer_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-instancingviewer.so"
  install -Dm644 "instancingviewer_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-instancingviewer.info"
}
