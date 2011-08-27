# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
pkgname=openflower
pkgver=1.0
pkgrel=2
pkgdesc="OpenFlower is an open source CFD software written in C++ mainly devoted to the resolution of the turbulent unsteady incompressible Navier-Stokes equations."
url="http://openflower.sourceforge.net/index2.html"
license="GPL"
depends=('laspack')
makedepends=('gcc')
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://dl.sourceforge.net/sourceforge/openflower/$pkgname-v$pkgver.tar.gz)
md5sums=(12fcd0d171cf88129492ebed4982ee64)

build() {
  cd $startdir/src/$pkgname-v$pkgver
  sed '/<fstream>/ a\#include <math.h>' < src/Geometry/Mesh.cpp > Mesh.cpp
  mv Mesh.cpp src/Geometry/Mesh.cpp
  sed '/<iostream>/ a\#include <math.h>' < src/Maths/OpConvection.cpp > OpConvection.cpp
  mv OpConvection.cpp src/Maths/OpConvection.cpp
  ./RunMeFirst
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
