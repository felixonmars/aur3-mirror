# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=wxphp-pecl-event
pkgdesc='Provides interface to libevent library'
pkgver=1.9.0
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/event'

makedepends=('libevent' 'wxphp')
source=("http://pecl.php.net/get/event-${pkgver}.tgz")
md5sums=('f88c6e55cb532d02fc51d4988e7fe4bf')
depends=('libevent' 'wxphp')

peclconfig="--prefix=/opt/wxphp \
 --bindir=/opt/wxphp/bin \
 --libdir=/opt/wxphp/lib \
 --sysconfdir=/etc/wxphp \
 --mandir=/opt/wxphp/man \
 --with-php-config=/opt/wxphp/bin/php-config
"

build() {
	export PATH="/opt/wxphp/bin:$PATH"

 	cd ${srcdir}/event-${pkgver} || return 1
 	/opt/wxphp/bin/phpize || return 1
	./configure ${peclconfig} || return 1
	make || return 1
}

package_wxphp-pecl-event() {

	install -d -m755 ${pkgdir}/opt/wxphp/lib/modules/
	cp ${srcdir}/event-${pkgver}/modules/event.so ${pkgdir}/opt/wxphp/lib/modules/event.so
}
