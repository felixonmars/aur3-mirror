# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=slipstream
pkgver=0.2
pkgrel=1
pkgdesc="A free racing vehicle simulator trying to be physically accurate and fun to play at the same time!"
arch=(any)
url="http://www.nongnu.org/slipstream/"
license=('GPL')
depends=('techne>=0.2.3' "$pkgname-data>=$pkgver" 'hicolor-icon-theme')
install="$pkgname.install"
source=("http://download-mirror.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('67c375066f9c73fb81aa6a610fe5d49b')

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
