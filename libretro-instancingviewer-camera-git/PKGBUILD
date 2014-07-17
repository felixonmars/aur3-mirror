# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-instancingviewer-camera-git
pkgver=82.a32ba3f
pkgrel=1
pkgdesc="Camera image InstancingViewer for libretro GL."
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/instancingviewer-camera"
license=('GPL3')
depends=('zlib' 'libgl')
makedepends=('git')

_gitname='instancingviewer-camera'
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/instancingviewer_camera_libretro.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  make
}

package() {
  install -Dm644 "${_gitname}/instancingviewer_camera_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-instancingviewer-camera.so"
  install -Dm644 "instancingviewer_camera_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-instancingviewer-camera.info"
}
