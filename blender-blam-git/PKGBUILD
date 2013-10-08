# Maintainer: kubriel <kubriel@servus.at>
# Contributor: Manuel Morales <te.vas.mucho.a.la.mierda@gmail.com>/stuffmatic at github
pkgname=blender-blam-git
pkgver=7f6258d
pkgrel=1
_blender=
pkgdesc="This is BLAM, a camera calibration toolkit for Blender in the form of an add-on, written in python, that facilitates modeling based on photographs."
arch=('any')
url="https://github.com/stuffmatic/blam/"
license=('GPL')
depends=('blender')
makedepends=('coreutils')
conflicts=()
source=(https://github.com/stuffmatic/blam.git)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/blam
  git describe --always | sed 's|-|.|g'
}

build() {
  _blender=$(blender -v | head -n 1 | awk '{print $2}')
  echo your blender version $_blender  
}

package() {

  mkdir -p "$pkgdir/usr/share/blender/$_blender/scripts/addons/"
  cp blam/src/blam.py "$pkgdir/usr/share/blender/$_blender/scripts/addons/"

}

