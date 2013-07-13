_pack=generate_html
pkgname=octave-$_pack
pkgver=0.1.5
pkgrel=1
pkgdesc="This package provides functions for generating HTML pages that contain the help texts for a set of functions. The package is designed to be as general as possible, but also contains convenience functions for generating a set of pages for entire packages."
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
md5sums=('0bf6ad9bc0811c853e11cafbc1e74bef')

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/octave/packages
  mkdir -p $pkgdir/usr/lib/octave/packages
  cp $_pack-$pkgver.tar.gz $pkgdir/usr/share/octave/$_pack.tar.gz
}