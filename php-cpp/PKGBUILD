# Maintainer: Jonjo McKay <jonjo@jonjomckay.com>
pkgname=php-cpp
pkgver=1.2.1
pkgrel=1
pkgdesc="Library to build PHP extensions with C++"
arch=('i686' 'x86_64')
url="http://www.php-cpp.com"
license=('Apache')
depends=('php')
conflicts=('php-cpp-git')
options=('strip' 'ccache')
source=("https://github.com/CopernicaMarketingSoftware/PHP-CPP/archive/v$pkgver.tar.gz")
md5sums=('3f10e68435232cf45c9c7fc6b3c6d9d6')

build() {
	cd "$srcdir/${pkgname^^}-$pkgver"
	make PHP_DIR=/usr/include/php
}

package() {
	cd "$srcdir/${pkgname^^}-$pkgver"
	mkdir -p "$pkgdir/usr/lib"
	make INSTALL_PREFIX="$pkgdir/usr" install
}
