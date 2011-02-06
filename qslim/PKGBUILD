# Contributor: Luke McCarthy <luke@iogopro.co.uk>

pkgname=qslim
pkgver=2.1
pkgrel=1
pkgdesc="Polygonal surface simplification package"
url="http://graphics.cs.uiuc.edu/~garland/research/quadrics.html"
license=('GPL')
depends=('fltk')
arch=('i686' 'x86_64')
source=(http://graphics.cs.uiuc.edu/~garland/dist/$pkgname-$pkgver.tar.gz fixes.diff)
md5sums=('07dce2db7e577e7852b1bcaa86aa5d0f' 'bc9d1e6b6a0605bad28d53cc53be8893')

build() {
  local srcroot=$startdir/src/$pkgname-$pkgver
  cd $srcroot
  patch -p1 < $startdir/src/fixes.diff || return 1
  cd $srcroot/libgfx
  ./configure || return 1
  cd src && make || return 1
  cd $srcroot/mixkit
  ./configure || return 1
  cd src && make || return 1
  cd $srcroot/tools/qslim
  make all || return 1
  install -d $startdir/pkg/usr/bin
  install -m 755 -t $startdir/pkg/usr/bin qslim qvis
}
