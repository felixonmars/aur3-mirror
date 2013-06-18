# Maintainer: Matt Hanley <aur@mjh.mx>

pkgname=php-xdiff
_pkgname=${pkgname#php-}
_extname=xdiff
pkgver=1.5.2
pkgrel=1
pkgdesc="Creates and applies patches to both text and binary files"
arch=("i686" "x86_64")
url="http://pecl.php.net/package/xdiff"
license=('PHP')
depends=(
	'php'
	'libxdiff'
)
source=("http://pecl.php.net/get/$_pkgname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
md5sums=('8b6f93bd700198c52da6e45949f95f3c')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D "modules/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}
