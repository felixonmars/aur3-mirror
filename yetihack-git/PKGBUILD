# Maintainer: Ray Hogenson <rayhogenson at gmail dot com>
pkgname=yetihack-git
pkgdesc="Text based game where you run from yetis"
pkgver=3.0.r0.g62cc737
pkgrel=1
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/yetihack"
license=('GPL')
depends=('ncurses' 'gcc-libs')
makedepends=('cmake')
provides=('yetihack')
options=()
source=("$pkgname"::'git+https://github.com/rayhogenson/yetihack.git')
md5sums=('SKIP')

pkgver() {
	 cd "$srcdir/yetihack"
	 git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname/build"
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make install
}
