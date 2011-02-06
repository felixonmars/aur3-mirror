# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk
pkgname=concorde
pkgver=031219
pkgrel=1 
pkgdesc="Concorde is a computer code for the traveling salesman problem (TSP)
and some related network optimization problems."
url="http://www.tsp.gatech.edu/concorde/index.html"
arch=(`arch`)
license=('Academic research only')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.tsp.gatech.edu/concorde/downloads/codes/src/co$pkgver.tgz)
md5sums=('3476e01ae89b591bf7b329b2f5aa0353')
build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/usr
  make || return 1
  install -m 755 -d $pkgdir/usr/{lib,bin,include}
  install -m 755 -t $pkgdir/usr/lib concorde.a
  install -m 755 -t $pkgdir/usr/include concorde.h
  install -m 755 -t $pkgdir/usr/bin TSP/concorde LINKERN/linkern EDGEGEN/edgegen FMATCH/fmatch CUT/mincut LOCALCUT/localcut 
  cd TOOLS
  install -m 755 -t $pkgdir/usr/bin edg2len edgunion fconvert prob2tsp showres tourchk tourlen
}
