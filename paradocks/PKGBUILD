# Maintainer: Giuseppe Marco Randazzo <gmrandazzo@gmail.com>
pkgname=paradocks
pkgver=0.1.1
pkgrel=1
pkgdesc="PARADOCKS - The Parallel Docking Suite with Population-Based Metaheuristics"
arch=("i686" "x86_64")
url="http://www.paradocks.org/"
license=('GPL')
depends=( 'boost' 'boost-libs' 'openscenegraph' 'scons' 'xerces-c' )
source=(http://europa.pharmazie.uni-halle.de/joomla/downloads/${pkgname}-${pkgver}.tar.bz)
md5sums=('fa59a0a191bfef1b924c5240c02d949f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i -e "s/env.Append(CCFLAGS = cflags+'-march=native -O2')/env.Append(CCFLAGS = cflags+'${CXXFLAGS}')/g" SConstruct || die
  sed -i -e "s/@scons -Q -j2/@scons -Q ${MAKEFLAGS}/" Makefile || die
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 paradocks $pkgdir/usr/bin/paradocks
}
