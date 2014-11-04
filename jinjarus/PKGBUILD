# Maintainer: Lucas Wendel <maesto@cccmz.de>
pkgname=jinjarus
pkgver=0.1
pkgrel=1
pkgdesc="Simple CLI for Jinja2"
arch=('any')
url="https://github.com/Maesto/jinjarus"
license=('MIT')
depends=('python-jinja')
checkdepends=()
source=(https://github.com/Maesto/$pkgname/archive/$pkgver.tar.gz)
md5sums=('78644c76b8b8abfaca572bc002698f05')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin/
	cp jinjarus.py $pkgdir/usr/bin/jinjarus
}
