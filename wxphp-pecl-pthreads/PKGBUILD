# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=wxphp-pecl-pthreads
pkgdesc='Threading API'
pkgver=2.0.2
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/pthreads'

makedepends=('wxphp')
source=("http://pecl.php.net/get/pthreads-${pkgver}.tgz")
md5sums=('58e35ed736fba5b4b93b65e2e5e27e31')
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

	cd ${srcdir}/pthreads-${pkgver} || return 1
	/opt/wxphp/bin/phpize || return 1
	./configure ${peclconfig} --enable-pthreads --enable-maintainer-zts || return 1
	make || return 1
}

package_wxphp-pecl-pthreads() {

	install -d -m755 ${pkgdir}/opt/wxphp/lib/modules/
	cp ${srcdir}/pthreads-${pkgver}/modules/pthreads.so ${pkgdir}/opt/wxphp/lib/modules/pthreads.so
}
