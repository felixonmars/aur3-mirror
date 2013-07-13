_pack=tsa
pkgname=octave-$_pack
pkgver=4.2.4
pkgrel=1
pkgdesc="A toolbox for Time Series Analysis ."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL version 3 or later')
depends=('octave>2.9.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('380d777fba834e1ca5bcd6e09c7e332a')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}