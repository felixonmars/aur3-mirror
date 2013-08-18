# Contributor: Andreas Schrafl <aschrafl@jetnet.ch>

pkgname=fsyncms
pkgver=0.13.0
pkgrel=0
pkgdesc="PHP Sync Server für Firefox Sync"
arch=('any')
license=('unknown')
depends=('php')
url="https://github.com/balu-/FSyncMS"
backup=('etc/webapps/fsyncms/settings.php')
source=(https://github.com/balu-/FSyncMS/archive/$pkgver.tar.gz)
md5sums=('1c6e56c0c807092fb9c46be0f1a7f39c')

package() {
	mkdir -p $pkgdir/usr/share/webapps/fsyncms/test
	cp $srcdir/FSyncMS-$pkgver/*.php $pkgdir/usr/share/webapps/fsyncms/
	cp $srcdir/FSyncMS-$pkgver/test/hash.php $pkgdir/usr/share/webapps/fsyncms/test/
	mkdir -p $pkgdir/etc/webapps/fsyncms
	touch $pkgdir/etc/webapps/fsyncms/settings.php
	chown http:http $pkgdir/etc/webapps/fsyncms/settings.php
	ln -s /etc/webapps/fsyncms/settings.php $pkgdir/usr/share/webapps/fsyncms/settings.php
}
