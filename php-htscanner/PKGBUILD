# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-htscanner
_extname=htscanner
pkgver=1.0.0
pkgrel=1
pkgdesc="Allow one to use htaccess-like file to configure PHP per directory, just like apache's htaccess."
arch=("i686" "x86_64")
url="http://pecl.php.net/package/htscanner"
license=('PHP')
depends=('php')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
md5sums=('b192752721be8e443bd07866401738b3')

build() {
	cd "${srcdir}/$_extname-$pkgver"

	phpize
	./configure
	make

	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

# vim:set ts=2 sw=2 et:
