# Contributor: b4283 <b4283 at gmail>

pkgname=superhudeditor
pkgver=0.3.0
pkgrel=1
pkgdesc="SuperHud Editor is a rewritten q3 cpma hud editor."
arch=('i686 x86_64')
url="http://www.plrf.org/superhudeditor/"
license=('GPL')
depends=() # idk !! can't find it anywhere.
source=(http://jaist.dl.sourceforge.net/sourceforge/superhudeditor/$pkgname-$pkgver-src.tar.gz)
md5sums=('f14f0f37c4cfedae096e8b0254bc6ab7')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=$pkgdir/usr
  make || return 1
  make install || return 1

}
