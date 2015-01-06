# Maintainer: Andrew Rose <hello@andrewrose.co.uk>
# Contributor: Andrew Rose <hello@andrewrose.co.uk>

pkgname=xphp-pecl-runkit
pkgdesc='For all those things you.... probably should not have been doing anyway'
pkgver=git
pkgrel=1

arch=('x86_64' 'i686')
license=('PHP')
url='http://pecl.php.net/package/runkit'

makedepends=('xphp')
source=("git+https://github.com/zenovich/runkit.git" 'https://github.com/zenovich/runkit/pull/71.diff')
md5sums=('SKIP' '35c159e62c4224e46ba046ae7ad88592')
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

	cd ${srcdir}/runkit || return 1
	patch -p1 < $startdir/71.diff
	/opt/xphp/bin/phpize || return 1
	./configure ${peclconfig}|| return 1
	make || return 1
}

package_xphp-pecl-runkit() {

	install -d -m755 ${pkgdir}/opt/xphp/lib/modules/
	cp ${srcdir}/runkit/modules/runkit.so ${pkgdir}/opt/xphp/lib/modules/runkit.so
	install -D -m 644 $startdir/runkit.ini ${pkgdir}/etc/xphp/conf.d/runkit.ini || return 1
}

