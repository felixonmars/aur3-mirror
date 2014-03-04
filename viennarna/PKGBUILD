# Maintainer: Christian Hoener zu Siederdissen <choener at tbi dot univie dot ac dot at>

pkgname=viennarna
pkgver=1.8.5
pkgrel=1
pkgdesc="RNA Secondary Structure Prediction and Comparison"
arch=(i686 x86_64)
license=('Custom')
url="http://www.tbi.univie.ac.at/RNA/"
depends=()
makedepends=()
source=(http://www.tbi.univie.ac.at/RNA/ViennaRNA-${pkgver}.tar.gz)

build() {
  cd $srcdir/ViennaRNA-$pkgver
  # forester does not compile (g2 breaks at DESTDIR)
  ./configure --prefix=/usr --without-forester || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  # no need for that file
  rm $pkgdir/usr/share/info/dir
}
md5sums=('cd70d63cc1be928a5f0973bd6c211e96')
