# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=wxphp-pecl-propro
pkgdesc='Property proxy'
pkgver=1.0.0
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/pecl_propro'

makedepends=('wxphp')
source=("http://pecl.php.net/get/propro-${pkgver}.tgz")
md5sums=('9c775035fd17c65f0162b7eb1b4f8564')
depends=('wxphp')

peclconfig="--prefix=/opt/wxphp \
 --bindir=/opt/wxphp/bin \
 --libdir=/opt/wxphp/lib \
 --sysconfdir=/etc/wxphp \
 --mandir=/opt/wxphp/man \
 --with-php-config=/opt/wxphp/bin/php-config
"

build() {
	export PATH="/opt/wxphp/bin:$PATH"

 	cd ${srcdir}/propro-${pkgver} || return 1
 	/opt/wxphp/bin/phpize || return 1
	./configure ${peclconfig} || return 1
	make || return 1
}

package_wxphp-pecl-propro() {

	install -d -m755 ${pkgdir}/opt/wxphp/lib/modules/
	install -d -m755 ${pkgdir}/opt/wxphp/include/php/ext/propro
	cp ${srcdir}/propro-${pkgver}/modules/propro.so ${pkgdir}/opt/wxphp/lib/modules/propro.so
	cp ${srcdir}/propro-${pkgver}/php_propro.h ${pkgdir}/opt/wxphp/include/php/ext/propro/php_propro.h
}
