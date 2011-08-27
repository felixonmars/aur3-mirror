# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=php-rrdtool
pkgver=1.4.3
pkgrel=1
pkgdesc="PHP bindings for rrdtool"
arch=('i686' 'x86_64')
url="http://oss.oetiker.ch/rrdtool/pub/contrib/"
license=('GPL')
depends=("rrdtool" 'php')
source=("http://oss.oetiker.ch/rrdtool/pub/contrib/php_rrdtool.tar.gz")
install=("php-rrdtool.install")

build() {
	cd "$srcdir/rrdtool"
	phpize
	./configure
	make || return 1
	install -D -m0755 modules/rrdtool.so "${pkgdir}/$(php-config --extension-dir)/rrdtool.so"
}

md5sums=('c86a45cfc54517b9066c480bbc589d43')
