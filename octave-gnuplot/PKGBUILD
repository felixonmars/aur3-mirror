_pack=gnuplot
pkgname=octave-$_pack
pkgver=1.0.1
pkgrel=1
pkgdesc="Scripts to save data in gnuplot-readable formats, specify gnuplot commands that will be used to produce graphics, and call gnuplot. See help g_ez quickly produce the most common plots."
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
md5sums=('298efdbb9628f3ccd44902078e0fdaf8')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}