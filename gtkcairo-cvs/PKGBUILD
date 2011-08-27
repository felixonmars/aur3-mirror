# Contributor: honzor <dorhonzor@gmail.com>
pkgname=gtkcairo-cvs
provides=('gtkcairo')
pkgver=20070807
pkgrel=1
pkgdesc="Cairo is a 2D graphics library with support for multiple output devices"
arch=(i686)
url="http://www.cairographics.org"
license=
depends=('gtk2')
makedepends=('cvs')
source=()
md5sums=()

build() {
  mkdir $startdir/src/$pkgname-$pkgver
  cd $startdir/src/$pkgname-$pkgver
  cvs -d :pserver:anoncvs@cvs.cairographics.org:/cvs/cairo co gtkcairo
  cd gtkcairo
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}