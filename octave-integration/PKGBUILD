_pack=integration
pkgname=octave-$_pack
pkgver=1.0.7
pkgrel=1
pkgdesc="Toolbox for 1-D, 2-D, and n-D Numerical Integration"
arch=('i686' 'x86_64')
url="http://octave.sourceforge.net/$_pack/index.html"
license=('GPL version 2 or later')
depends=('octave>=2.9.7')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
source=("http://downloads.sourceforge.net/octave/$_pack-$pkgver.tar.gz")
noextract=("$_pack-$pkgver.tar.gz")
md5sums=('ccd4224ec51e35ccd50c6a119f304284')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}