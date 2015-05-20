# Maintainer: aquarius <aquarius24@yandex.ru>
# Contributor: Manuel Morales <te.vas.mucho.a.la.mierda@gmail.com>/stuffmatic at github
pkgname=blender-blam
pkgver=0.6
pkgrel=1
_blender=2.63+
pkgdesc="This is BLAM, a camera calibration toolkit for Blender in the form of an add-on, written in python, that facilitates modeling based on photographs."
arch=('any')
url="https://github.com/stuffmatic/blam"
license=('GPL')
depends=('blender')
makedepends=('coreutils')
conflicts=()
source=(https://github.com/stuffmatic/blam.git)
md5sums=('SKIP')

pkgver() {
  cd $srcdir
  git clone $source
}

build() {
  _blender=$(blender -v | head -n 1 | awk '{print $2}')
  echo your blender version $_blender  
}

package() {
  _blender=$(blender -v | head -n 1 | awk '{print $2}')
  mkdir -p "$pkgdir/usr/share/blender/$_blender/scripts/addons/"
  cp blam/src/blam.py "$pkgdir/usr/share/blender/$_blender/scripts/addons/"

}

