_pack=lssa
pkgname=octave-$_pack
pkgver=0.1.2
pkgrel=1
pkgdesc="A package implementing tools to compute spectral decompositions of  irregularly-spaced time series.  Currently includes functions based off the  Lomb-Scargle periodogram and Adolf Mathias' implementation for R and C (see  URLs)."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPLv3+')
depends=('octave>=3.6.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('386aaded5831f28975a3166799a02409')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}