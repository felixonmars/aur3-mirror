# Maintainer: paolo veronelli <paolo.veronelli@gmail.com>
pkgname=openscad-bin-amd64
_tarname=openscad
_platform=linux-x64
pkgver=2011.06
pkgrel=2
pkgdesc="OpenSCAD is a software for creating solid 3D CAD objects."
arch=('x86_64')
license=('GPLv2')
url="http://openscad.org/"
source=(https://github.com/downloads/openscad/openscad/${_tarname}-${pkgver}.${_platform}.tar.gz)
md5sums=('7e35b2e2473acd14f72f60d4e797b1a5')
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
