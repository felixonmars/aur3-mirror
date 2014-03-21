# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=wxphp-pecl-runkit
pkgdesc='For all those things you.... probably should not have been doing anyway'
pkgver=git
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/runkit'

makedepends=('wxphp')
source=("git+https://github.com/zenovich/runkit.git")
md5sums=('SKIP')
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

	cd ${srcdir}/runkit || return 1
	/opt/wxphp/bin/phpize || return 1
	./configure ${peclconfig}|| return 1
	make || return 1
}

package_wxphp-pecl-runkit() {

	install -d -m755 ${pkgdir}/opt/wxphp/lib/modules/
	cp ${srcdir}/runkit/modules/runkit.so ${pkgdir}/opt/wxphp/lib/modules/runkit.so
}

