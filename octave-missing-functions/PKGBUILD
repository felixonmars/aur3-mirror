_pack=missing-functions
pkgname=octave-$_pack
pkgver=1.0.2
pkgrel=1
pkgdesc="Find functions that are in Matlab but not in Octave."
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL version 2 or later')
depends=('octave>=3.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('d975028d2a0fa9778b4ffedd4c1abba2')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}