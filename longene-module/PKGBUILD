# Contributor: Ali H. Caliskan <ali.h.caliskan//gmail.com>

pkgname=longene-module
pkgver=0.2.4.1
pkgrel=1
pkgdesc="Provides linux kernel module for Longene."
arch=('i686')
url="http://www.longene.org/en/index.php"
license=('GPL')
depends=('longene')
install=('longene-module.install')
source=("http://www.longene.org/download/unifiedkernel-$pkgver.tar.bz2")
md5sums=('1d805f6471dae6d86bfaf77225937420')
 
build() {

	cd $srcdir/unifiedkernel-$pkgver/module
	make || reurn 1
	install -Dm644 unifiedkernel.ko \
	$pkgdir/lib/modules/2.6.30-uk/kernel/uk/unifiedkernel.ko

}
