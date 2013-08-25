# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kte-collaborative
pkgver=0.0.95
pkgrel=1
pkgdesc="A plugin for KTextEditor which allows to edit text documents collaboratively"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/network/kte-collaborative'
license=('GPL')
depends=('libqinfinity' 'telepathy-kde-common-internals')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz")
md5sums=('ea08b3e38df2ef5c4499f819836ade06') 

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
