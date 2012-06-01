# Maintainer: Filip Graliński <filipg@amu.edu.pl>
pkgname=sfst
pkgver=1.4.6g
pkgrel=5
pkgdesc='Toolbox for the implementation of morphological analysers'
arch=('i686' 'x86_64')
url='http://www.ims.uni-stuttgart.de/tcl/SOFTWARE/SFST.html'
license=('GPL2')
makedepends=()
depends=(readline gcc-libs)
install=
source=(ftp://ftp.ims.uni-stuttgart.de/pub/corpora/SFST/SFST-$pkgver.tar.gz
        sfst.patch)
md5sums=('574f124731ab1b87696fdd9b8a6e4a7d'
         '6114539e47b7cf6faed5db4c18453dbb')

build() {
  cd "$srcdir/SFST"
  patch -p1 -i $srcdir/sfst.patch

  cd src

  DESTDIR=${pkgdir} make || return 1
  DESTDIR=${pkgdir} make libsfst.so || return 1

  DESTDIR=${pkgdir} make install maninstall libinstall || return 1
}
