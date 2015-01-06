# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=xphp-pecl-http
pkgdesc='Extended HTTP Support'
pkgver=2.2.0RC1
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/pecl_http'

makedepends=('xphp' 'xphp-pecl-raphf' 'xphp-pecl-raphf')
source=("http://pecl.php.net/get/pecl_http-${pkgver}.tgz")
md5sums=('8f1cb5bdeae4faac322cc50362d75a75')
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

 	cd ${srcdir}/pecl_http-${pkgver} || return 1
 	/opt/xphp/bin/phpize || return 1
	./configure ${peclconfig} || return 1
	make || return 1
}

package_xphp-pecl-http() {

	install -d -m755 ${pkgdir}/opt/xphp/lib/modules/
	cp ${srcdir}/pecl_http-${pkgver}/modules/http.so ${pkgdir}/opt/xphp/lib/modules/http.so
	install -D -m 644 $startdir/http.ini ${pkgdir}/etc/xphp/conf.d/http.ini || return 1
}
