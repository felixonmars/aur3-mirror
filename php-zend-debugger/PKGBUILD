# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>

pkgname=php-zend-debugger
pkgver=5.4.0
_pkgrel=20120214
pkgrel=1
pkgdesc="Zend Debugger extention for PHP"
arch=('i686' 'x86_64')
url="http://www.zend.com/en/community/pdt"
license=('custom')
depends=('php>=5.4')
conflicts=('zend-debugger')
provides=('zend-debugger')
install=${pkgname}.install
_repo=http://downloads.zend.com/studio-eclipse/updates-extra/9_0
source=(
	${_repo}/plugins/com.zend.php.debug.debugger.php54.linux.x86_64_${pkgver}.v${_pkgrel}.jar
	zend_debugger.ini
	${pkgname}.install
)
md5sums=(
	e02899d0e1c38e3041601c06b8e4c9e2
	ed5430a12114428be83fa3fb08e740b1
	abbdb49cf13828f4cb08791af299558a
)
[ "$CARCH" == "i686" ] && {
	source[0]=${source[0]/x86_64/x86}
	md5sums[0]=8e2632d648d965259eb1928eac2165fd
}

build() {
	cd "$srcdir"
	install -D -m 744 resources/php54/ZendDebugger.so "$pkgdir/usr/lib/php/modules/zend_debugger.so"
	install -D -m 744 ../zend_debugger.ini "$pkgdir/etc/php/conf.d/zend_debugger.ini"
}
