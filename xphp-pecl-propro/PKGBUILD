# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=xphp-pecl-propro
pkgdesc='Property proxy'
pkgver=1.0.0
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/pecl_propro'

makedepends=('xphp')
source=("http://pecl.php.net/get/propro-${pkgver}.tgz")
md5sums=('9c775035fd17c65f0162b7eb1b4f8564')
depends=('xphp')

peclconfig="--prefix=/opt/xphp \
 --bindir=/opt/xphp/bin \
 --libdir=/opt/xphp/lib \
 --sysconfdir=/etc/xphp \
 --mandir=/opt/xphp/man \
 --with-php-config=/opt/xphp/bin/php-config
"

build() {
	export PATH="/opt/xphp/bin:$PATH"

 	cd ${srcdir}/propro-${pkgver} || return 1
 	/opt/xphp/bin/phpize || return 1
	./configure ${peclconfig} || return 1
	make || return 1
}

package_xphp-pecl-propro() {

	install -d -m755 ${pkgdir}/opt/xphp/lib/modules/
	install -d -m755 ${pkgdir}/opt/xphp/include/php/ext/propro
	cp ${srcdir}/propro-${pkgver}/modules/propro.so ${pkgdir}/opt/xphp/lib/modules/propro.so
	cp ${srcdir}/propro-${pkgver}/php_propro.h ${pkgdir}/opt/xphp/include/php/ext/propro/php_propro.h
	install -D -m 644 $startdir/propro.ini ${pkgdir}/etc/xphp/conf.d/propro.ini || return 1
}
