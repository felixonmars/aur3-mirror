# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=xphp-pecl-raphf
pkgdesc='Resource and persistent handles factory'
pkgver=1.0.4
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/pecl_raphf'

makedepends=('xphp')
source=("http://pecl.php.net/get/raphf-${pkgver}.tgz")
md5sums=('e5e7e5c3954a5fd31c034c347f22c4a5')
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

 	cd ${srcdir}/raphf-${pkgver} || return 1
 	/opt/xphp/bin/phpize || return 1
	./configure ${peclconfig} || return 1
	make || return 1
}

package_xphp-pecl-raphf() {

	install -d -m755 ${pkgdir}/opt/xphp/lib/modules/
	install -d -m755 ${pkgdir}/opt/xphp/include/php/ext/raphf
	cp ${srcdir}/raphf-${pkgver}/modules/raphf.so ${pkgdir}/opt/xphp/lib/modules/raphf.so
	cp ${srcdir}/raphf-${pkgver}/php_raphf.h ${pkgdir}/opt/xphp/include/php/ext/raphf/php_raphf.h
	install -D -m 644 $startdir/raphf.ini ${pkgdir}/etc/xphp/conf.d/raphf.ini || return 1
}
