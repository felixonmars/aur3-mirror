# Contributor: Jonathan Wiersma <archaur at jonw dot org>
pkgname=eclipse-pdt-debugger
pkgver=I20081217
pkgrel=1
pkgdesc="PHP debugging support for eclipse-pdt"
arch=('i686' 'x86_64')
url="http://www.zend.com/community/pdt"
license=('EPL')
depends=( 'eclipse-pdt>=2.1' )
optdepends=('php-zend-debugger' 'xdebug')
noextract=($_archive)
source=("$pkgname-$pkgver.zip::http://downloads.zend.com/pdt/debugger/org.zend.php.debug_feature-$pkgver.zip")
md5sums=('c7a2d3c5339543c1fab1121f6b825c63')

build() {
	cd $srcdir || return 1
	jar xf $pkgname-$pkgver.zip || return 1
	install -dm755 $pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/ || return 1
	find eclipse -type f -exec install -Dm644 {} \
		$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/{} \; || return 1
}
