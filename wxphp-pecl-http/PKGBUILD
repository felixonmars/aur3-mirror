# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=wxphp-pecl-http
pkgdesc='Extended HTTP Support'
pkgver=2.0.5
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/pecl_http'

makedepends=('wxphp' 'wxphp-pecl-raphf' 'wxphp-pecl-raphf')
source=("http://pecl.php.net/get/pecl_http-${pkgver}.tgz")
md5sums=('14715aedd483c0ebdd08b56c00c4c5bf')
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

 	cd ${srcdir}/pecl_http-${pkgver} || return 1
 	/opt/wxphp/bin/phpize || return 1
	./configure ${peclconfig} || return 1
	make || return 1
}

package_wxphp-pecl-http() {

	install -d -m755 ${pkgdir}/opt/wxphp/lib/modules/
	cp ${srcdir}/pecl_http-${pkgver}/modules/http.so ${pkgdir}/opt/wxphp/lib/modules/http.so
}
