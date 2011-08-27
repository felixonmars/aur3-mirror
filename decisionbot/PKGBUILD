pkgname=decisionbot
pkgver=0.1
pkgrel=2
pkgdesc="A ruby bot that makes decisions for you!"
arch=(i686 x86_64)
license=('GPL')
url="http://www.sfu.ca/~awp2/"
source=(http://www.sfu.ca/~awp2/decisionbot-$pkgver.tar.gz)
depends=('ruby')
md5sums=('b0d95533512f3e315e8befa7edd37f3c')

build() {
	cd $srcdir/$pkgname-$pkgver
	install -d $pkgdir/usr/bin/
	cp decisionbot $pkgdir/usr/bin/decisionbot
	chmod 755 $pkgdir/usr/bin/decisionbot
}

