# Maintainer: Mijo Medvedec <mijo dot medvedec at gmail dot com>

pkgname=krossword
pkgver=0.18.2
pkgrel=1
pkgdesc="A crossword puzzle game and editor for KDE"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Krossword?content=166281"
license=('GPL2')
depends=('qt4' 'kdebase-runtime' 'libkdegames')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/166281-${pkgname}-${pkgver}.tar.gz")
md5sums=('f4d4ba8c86fb3ae28d35d1876efc73ee')
sha256sums=('6e89a2360e3931e00a67fec9a63e93c32aaab5da4d7026100bef13b8ec4a3951')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir build && cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
	..
	
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
