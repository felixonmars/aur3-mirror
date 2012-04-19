# Maintainer: Thomas Girod <girodt@gmail.com>
pkgname=openscad-bin
_tarname=openscad
_platform=linux-x86
pkgver=2011.06
pkgrel=2
pkgdesc="OpenSCAD is a software for creating solid 3D CAD objects."
arch=('i686')
license=('GPLv2')
url="http://openscad.org/"
source=(https://github.com/downloads/openscad/openscad/${_tarname}-${pkgver}.${_platform}.tar.gz)
md5sums=('6d3cf432d78140f85274c1ec6879a44c')
conflicts=(openscad openscad-git openscad-svn)

build() {
  cd ${srcdir}/${_tarname}-${pkgver}.${_platform}

  mkdir -p $pkgdir/usr/{bin,lib}
  mkdir -p $pkgdir/usr/share/openscad/{examples,libraries}

  cp -rv bin/* $pkgdir/usr/bin
  cp -rv lib/* $pkgdir/usr/lib
  cp -rv examples/* $pkgdir/usr/share/openscad/examples
  cp -rv libraries/* $pkgdir/usr/share/openscad/libraries
}
