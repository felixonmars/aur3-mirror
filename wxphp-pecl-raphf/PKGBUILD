# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=wxphp-pecl-raphf
pkgdesc='Resource and persistent handles factory'
pkgver=1.0.4
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/pecl_raphf'

makedepends=('wxphp')
source=("http://pecl.php.net/get/raphf-${pkgver}.tgz")
md5sums=('e5e7e5c3954a5fd31c034c347f22c4a5')
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

 	cd ${srcdir}/raphf-${pkgver} || return 1
 	/opt/wxphp/bin/phpize || return 1
	./configure ${peclconfig} || return 1
	make || return 1
}

package_wxphp-pecl-raphf() {

	install -d -m755 ${pkgdir}/opt/wxphp/lib/modules/
	install -d -m755 ${pkgdir}/opt/wxphp/include/php/ext/raphf
	cp ${srcdir}/raphf-${pkgver}/modules/raphf.so ${pkgdir}/opt/wxphp/lib/modules/raphf.so
	cp ${srcdir}/raphf-${pkgver}/php_raphf.h ${pkgdir}/opt/wxphp/include/php/ext/raphf/php_raphf.h
}
