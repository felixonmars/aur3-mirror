# Maintainer: prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-shaders-git
pkgver=328.1ecb0fb
pkgrel=1
pkgdesc="Common shaders for libretro"
arch=('any')
url="https://github.com/libretro/common-shaders"
license=('unknown')

# if cg shaders work for you at runtime, leave as is, otherwise comment out
depends=('nvidia-cg-toolkit')
makedepends=('git')

# if you really need glsl, uncomment this instead
# makedepends=('git' 'python' 'nvidia-cg-toolkit' 'retroarch-git')

_gitname=common-shaders
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

# only need build step for glsl conversion
# build() {
#   mkdir out
#   retroarch-cg2glsl common-shaders out
# }

package() {
  install -d "${pkgdir}/usr/share/libretro/shaders"

  # CG shaders
  cp -r common-shaders/* "${pkgdir}/usr/share/libretro/shaders"

  # GLSL, if really needed
  # cp -r out/* "${pkgdir}/usr/share/libretro/shaders/"
}
