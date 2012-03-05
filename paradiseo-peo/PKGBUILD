# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Caner Candan <caner@candan.fr>
pkgbase=paradiseo
pkgname=('paradiseo-peo')
#'paradiseo-eo'
#'paradiseo-mo'
#'paradiseo-moeo'
#'paradiseo-gpu'
pkgver=1.3
pkgrel=beta2
#pkgdesc="A C++ white-box object-oriented framework dedicated to the reusable design of metaheuristics."
url="http://paradiseo.gforge.inria.fr"
arch=('any')
license=('CeCill')
#groups=('paradiseo')
source=(https://gforge.inria.fr/frs/download.php/27238/$pkgbase-$pkgver-$pkgrel.tar.gz)
md5sums=('3b06cee07af639fcc9e28999212c689b')
#https://gforge.inria.fr/frs/download.php/27238/paradiseo-1.3-beta2.tar.gz
rootdir=$srcdir/$pkgbase-$pkgver-$pkgrel
bindir=$rootdir/paradiseo-peo/build
pkgdesc='Parallel models of Metaheuristics'
depends=()
conflicts=()

build() {
  mkdir -p $bindir
  cd $bindir
  cmake -DCMAKE_INSTALL_PREFIX=/usr -Dconfig=$rootdir ..
  make || return 1
}

package() {
  cd $bindir
  make install DESTDIR=$pkgdir
}
