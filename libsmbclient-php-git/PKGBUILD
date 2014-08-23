pkgname=libsmbclient-php-git
pkgver=0.5.0.10.gd6b6504
_extname=libsmbclient
pkgrel=2
pkgdesc="libsmbclient bindings for php"
arch=('i686' 'x86_64')
url="https://github.com/eduardok/libsmbclient-php"
license=('PHP')
depends=('smbclient' 'php')
makedepends=('git')
source=('git://github.com/eduardok/libsmbclient-php')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --always | sed 's|-|.|g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	phpize
	./configure --prefix=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
	echo "extension=$_extname.so" > $_extname.ini
	install -D -m644 $_extname.ini "$pkgdir/etc/php/conf.d/$_extname.ini"
}
