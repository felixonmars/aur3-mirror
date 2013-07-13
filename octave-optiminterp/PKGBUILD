_pack=optiminterp
pkgname=octave-$_pack
pkgver=0.3.4
pkgrel=1
pkgdesc="An optimal interpolation toolbox for octave. This package provides functions to perform a n-dimensional optimal interpolations of arbitrarily distributed data points."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPLv3+')
depends=('octave>=2.9.9')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('d7695f84cd61cbd795e629d6804a90d6')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}