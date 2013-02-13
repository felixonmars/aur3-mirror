# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=contrafold
pkgver=2.02
pkgrel=1
pkgdesc="CONditional TRAining for RNA Secondary Structure Prediction"
arch=(i686 x86_64)
url="http://contra.stanford.edu/"
license=('BSD')
source=(http://contra.stanford.edu/contrafold/contrafold_v2_02.tar.gz)
md5sums=('cea66c63df835fe7f790c7f49ce83ef3')

build() {
  cd "$srcdir/$pkgname/src/"
  sed -i '/#include <algorithm>/ i #include <limits.h>' Utilities.hpp
  sed -i 's/DoLineSearch/this->DoLineSearch/' LBFGS.ipp
  make
}

package() {
  cd "$srcdir/$pkgname/src/"
  mkdir -p "$pkgdir/opt/contrafold/"
  cp contrafold score_prediction contrafold.params.* "$pkgdir/opt/contrafold/"
}

# vim:set ts=2 sw=2 et:
