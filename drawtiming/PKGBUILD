# Maintainer:  JWC <bulk-aaa@ttt-jwcxz-ddd.tttcom>

pkgname=drawtiming
pkgver=0.7.1
pkgrel=1
pkgdesc="A utility to draw timing diagrams"
arch=('any')
url="http://drawtiming.sourceforge.net"
license=('GPL')
depends=('imagemagick')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('bc25f43f5301ee6cfb65ed8e151a2e1d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cd src
  patch < $startdir/fix-strings.patch
  cd ..

  CPPFLAGS=-I/usr/include LDFLAGS=-L/usr/lib ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
