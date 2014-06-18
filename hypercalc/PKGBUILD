# Maintainer: Simon Hollingshead <me at [firstnamelastname] dot com>
pkgname=hypercalc
pkgver=20140606
pkgrel=1
pkgdesc="A calculator designed to calculate extremely large numbers without overflowing."
arch=('any')
url="http://mrob.com/pub/perl/hypercalc.html"
license=('GPL')
depends=('perl')
source=(http://mrob.com/pub/comp/$pkgname/$pkgname.txt)
md5sums=('84aa1a6da4708fc197d11a4beb5771d2')

package() {
	mkdir -p $pkgdir/usr/bin
	install -T $srcdir/$pkgname.txt $pkgdir/usr/bin/$pkgname
}
