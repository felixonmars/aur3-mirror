# Maintainer: Mijo Medvedec <mijo dot medvedec at gmail dot com>

pkgname=ktoshiba
pkgver=4.3.1
pkgrel=1
pkgdesc="Fn-Key monitoring for Toshiba laptops"
arch=('i686' 'x86_64')
url="http://ktoshiba.sourceforge.net/"
license=('GPL2')
depends=('kdebase-runtime' 'qt4')
makedepends=('cmake' 'automoc4')
optdepends=('solid: Hardware integration and detectio')
install=${pkgname}.install
source=("http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz")
md5sums=('4006d92a41557823a7a23fce9cf1d5bb')
sha256sums=('1fcb64d1c7bb0eacb62590b54b1d8f9aec22f0438621de97b79de2b784648ac2')

build() {
	cd "$pkgname-$pkgver"
	mkdir build && cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
       	      -DCMAKE_BUILD_TYPE=Release \
	      -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
	      -Wno-dev \
	..

	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
