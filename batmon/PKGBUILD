# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: libernux <dutchman55@gmx.com>

pkgname=batmon
pkgver=0.8
pkgrel=1
pkgdesc="GNUstep battery monitor"
arch=(i686 x86_64)
url="http://www.nongnu.org/gap/batmon"
license=('GPL')
depends=(gnustep-base gnustep-gui gnustep-back)
makedepends=(gcc-objc)
source=(http://savannah.nongnu.org/download/gap/$pkgname-$pkgver.tar.gz)
md5sums=('c8bebb902a5406830dab4a8ca246f0aa')


build() {
  cd $srcdir/$pkgname-$pkgver
  # necessary to set environment if not in user startup.
  . /usr/share/GNUstep/Makefiles/GNUstep.sh
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
