_pack=combinatorics
pkgname=octave-$_pack
pkgver=2.0.0
pkgrel=1
pkgdesc="Combinatorics functions, incuding partitioning. This a dummy package as transition for the miscellaneous package."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPLv3+')
depends=('octave-miscellaneous>=1.2.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('2c0475837d74a68c758936e561dbaae4')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}