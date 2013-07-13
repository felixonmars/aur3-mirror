_pack=octgpr
pkgname=octave-$_pack
pkgver=1.2.0
pkgrel=1
pkgdesc="The package allows interpolating and smoothing scattered multidimensional data using Gaussian Process Regression (also known as Kriging). Projected Gaussian Process regression is also  experimentally supported."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL v3')
depends=('octave>=3.2.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('a48954ac52b03f19bea6755ebefd7efa')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}