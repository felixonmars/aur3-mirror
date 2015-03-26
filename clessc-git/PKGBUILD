# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>

pkgname=clessc-git
pkgver=0.1.388.3e6848b
pkgrel=1
pkgdesc="LESS CSS compiler writen in C++"
arch=('i686' 'x86_64')
url="https://github.com/BramvdKroef/clessc"
license=('GPL')
depends=('libpng' 'libjpeg-turbo')
conflicts=('nodejs-less')
makedepends=('git' 'gcc')
source=("git+https://github.com/BramvdKroef/clessc.git#commit=master")
sha256sums=('SKIP')

pkgver() {
	export APP_VER=${pkgver}
	cd ${srcdir}/clessc
	echo "0.1.$(git log --oneline | wc -l).$(git describe --always | sed 's|-|.|g')"
}

build() {
	cd clessc
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd clessc
	make DESTDIR="$pkgdir" install
}
