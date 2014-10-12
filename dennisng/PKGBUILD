# Maintainer: Boudhayan Gupta <me at baloneygeek dot com>

pkgname=dennisng
pkgver=1.0.0
pkgrel=1
pkgdesc="A TCP DNS Proxy"
arch=('i686' 'x86_64')
license=('Apache')
depends=('qt5-base')
makedepends=('git')
url="https://github.com/BaloneyGeek/dennisng"
source=($pkgname::git+https://github.com/BaloneyGeek/$pkgname.git#tag=$pkgver)
md5sums=('SKIP')

build() {
	cd $pkgname
	qmake-qt5
	make
}

package() {
	cd $pkgname
	make INSTALL_ROOT="$pkgdir" install
}