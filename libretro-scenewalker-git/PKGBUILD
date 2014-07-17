# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-scenewalker-git
pkgver=116.b70f7eb
pkgrel=1
pkgdesc="FPS SceneWalker for libretro GL with basic gravity and collision detection."
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/scenewalker-libretro"
license=('GPL3')
depends=('zlib' 'libgl')
makedepends=('git')

_gitname=scenewalker-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/scenewalker_libretro.info")
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
  install -Dm644 "${_gitname}/scenewalker_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-scenewalker.so"
  install -Dm644 "scenewalker_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-scenewalker.info"
}
