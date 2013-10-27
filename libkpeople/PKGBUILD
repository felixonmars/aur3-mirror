# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=libkpeople
pkgver=0.1.0
pkgrel=1
pkgdesc="A contact aggregation library for KDE"
arch=('i686' 'x86_64')
url='http://community.kde.org/KTp/libkpeople'
license=('LGPL')
depends=('nepomuk-core')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/unstable/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('3d5401b90eabbf6c230ba4b56d527c67') 

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install
}
