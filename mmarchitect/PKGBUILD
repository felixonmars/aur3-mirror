pkgname=mmarchitect
pkgver=0.5.0
pkgrel=1
pkgdesc="gui for mind mapping"
arch=('x86_64' 'i686')
url="http://mmarchitect.zeropage.cz/"
license=('BSD')
depends=('gtk2' 'libgee06' 'librsvg')
makedepends=('vala')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")

build() {
  cd "$pkgname-$pkgver"
  make configure PREFIX="/usr/"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('bb67a927dd126c659bb53164964c2c5c')
