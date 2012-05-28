# Maintainer: speps <speps at aur dot archlinux dot org>

_name=slipstream
pkgname=$_name-data
pkgver=0.2
pkgrel=1
pkgdesc="A free racing vehicle simulator trying to be physically accurate and fun to play at the same time! Data."
arch=(any)
url="http://www.nongnu.org/slipstream/"
license=('GPL')
source=("http://download.savannah.gnu.org/releases/$_name/$pkgname-$pkgver.tar.bz2")
md5sums=('f9af796479250f7f2ce8476527bc6d94')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
