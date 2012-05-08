# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=tabble
pkgver=0.43
pkgrel=1
pkgdesc="A small alternative X shell which presents your programs in tabs for easy launch"
arch=(i686 x86_64)
url="http://www.rillion.net/tabble/index.html"
license=('GPL')
depends=('gtk2')
makedepends=('make' 'gcc')
source=(http://www.rillion.net/tabble/$pkgname-$pkgver.tar.gz)
md5sums=('4e594b45ab20b3577d59566fc0f9a6ee')
sha256sums=('6469cd2d46846014c84461bbeec9d32de87d1c21fef6ec3437099e6abfe3cfdf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make

}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
