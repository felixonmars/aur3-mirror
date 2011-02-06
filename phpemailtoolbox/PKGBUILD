# Contributor: Glenn Matthys <glenn@webmind.be>
pkgname=phpemailtoolbox 
pkgdesc="A small set of generic classes and functions related to email"
pkgver=1.3
pkgrel=1
license="Public domain"
arch=(
	'i686'
	'x86_64'
)
url="http://projects.webmind.be/phpemailtoolbox"
source=(
	${url}/releases/${pkgname}-${pkgver}.tar.gz
)
md5sums=(006be09613552847fbecff5c84be473c)
depends=(php)

build() {
	mkdir -p $startdir/pkg/usr/share/php/phpemailtoolbox

	cd $startdir/src/$pkgname-$pkgver

	destdir=$startdir/pkg/usr/share/php/phpemailtoolbox/

	install -D -m644 class.phpemailtoolbox_email.php	$destdir/class.phpemailtoolbox_email.php
	install -D -m644 function.checkBlackLists.php		$destdir/function.checkBlackLists.php
	install -D -m644 function.checkClientPTR.php		$destdir/function.checkClientPTR.php
	install -D -m644 function.checkEnveloppeSender.php	$destdir/function.checkEnveloppeSender.php
	install -D -m644 function.checkHELO.php				$destdir/function.checkHELO.php
	install -D -m644 function.isFQDN.php				$destdir/function.isFQDN.php
	install -D -m644 function.reverseIP4.php			$destdir/function.reverseIP4.php
	install -D -m644 function.splitAddress.php			$destdir/function.splitAddress.php
}
