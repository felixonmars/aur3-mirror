# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jacobe
pkgver=7.3.14
pkgrel=2
pkgdesc="Configurable code beautifier for the Java programming language"
arch=('i686' 'x86_64')
url="http://www.tiobe.com/index.php/content/products/jacobe/Jacobe.html"
license=('custom')
depends=('bash')
source=("http://www.tiobe.com/content/products/jacobe/jacobe.linux.tar.gz"
"jacobe.sh" LICENSE)
md5sums=('fe4e3544094878af85c84f5236b9bc4b'
         'f1d5075ff6bd543e08d08734a316243e'
         'c42dc30cddc9593ea287269408a6f94e')

package() {
	cd "$srcdir"
	install -Dm755 jacobe "$pkgdir/usr/bin/jacobe-bin"
	install -m644 sun.cfg "$pkgdir/usr/bin/sun.cfg"
	install -Dm755 jacobe.sh "$pkgdir/usr/bin/jacobe"
	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/personal_edition.txt"
}

