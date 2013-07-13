_pack=instrument-control
pkgname=octave-$_pack
pkgver=0.2.0
pkgrel=1
pkgdesc="Low level I/O functions for serial, i2c, parallel, tcp, gpib, vxi11 and usbtmc interfaces."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPLv3+')
depends=('octave>=3.2.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('1cc5f2efe36fb0fafee9afa6ae98727b')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}