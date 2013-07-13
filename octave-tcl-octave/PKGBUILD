_pack=tcl-octave
pkgname=octave-$_pack
pkgver=0.1.8
pkgrel=1
pkgdesc="socket implementation of a tcl-octave connection"
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('Public Domain')
depends=('octave>=2.9.7')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('a98faee2560360e6282f153f185995bf')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}