_pack=parallel
pkgname=octave-$_pack
pkgver=2.0.5
pkgrel=2
pkgdesc="Parallel execution package for cluster computers. See also package openmpi_ext, maintained by Riccardo Corradini. For parallel execution on a single machine see e.g. function parcellfun (author: Jaroslav Hajek) in package general."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL')
depends=('octave>=3.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('ac9a8aa764c489c413f0e354a752a49e')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}
