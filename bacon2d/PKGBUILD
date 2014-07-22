# Maintainer: Roger Zanoni <rogerzanoni@gmail.com>

pkgname=bacon2d
pkgver=0.90.1
pkgrel=1
pkgdesc="Bacon2D is a framework to ease 2D game development, providing ready-to-use QML elements representing basic game entities needed by most of games."

arch=('i686' 'x86_64')
url="http://bacon2d.com"
license=('LGPLv2')
depends=('qt5-base')
makedepends=()
source=(https://github.com/Bacon2D/Bacon2D/releases/download/${pkgver}/${pkgver}.tar.gz)

build() {
	cd "${srcdir}"

	qmake PREFIX=/usr
	make
}

package() {
	cd "${srcdir}"
	make INSTALL_ROOT="$pkgdir" install
}

sha256sums=('8fa0c82aa66476b8330d05231c56c11f2d2807b6f616429580479e3683cc21d4')