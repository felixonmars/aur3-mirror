# Contributor: Andrew O'Neil <ajoneil@gmail.com>
pkgname=bud
pkgver=3.04
pkgrel=1
pkgdesc="Build tool for the D programming language."
url="http://dsource.org/projects/build"
depends=('dmd')
source=(http://trac.dsource.org/projects/build/browser/downloads/${pkgname}-${pkgver}.src.zip?format=raw)
md5sums=()

build() {
  cd ${startdir}/src
  unzip ${pkgname}-${pkgver}.src.zip?format=raw
  cd ${pkgname}-${pkgver}/Source
  make -f Makefile.unix
  
  mkdir -p ${startdir}/pkg/usr/bin
  cp $startdir/src/${pkgname}-${pkgver}/Source/build ${startdir}/pkg/usr/bin/bud
}

