# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=kdeplasma-addons-applets-steam
pkgver=0.1
pkgrel=1
pkgdesc='Plasma applet providing a steam game launcher'
license=('GPL2')
url=("https://github.com/flying-sheep/steam-plasmoid")
arch=('i686' 'x86_64')
depends=('plasma-workspace')
makedepends=('extra-cmake-modules')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('28b8f7877b9b6e7c2853b530145123c1d8be86dfede7d4888f889254dbd27fe0')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake "../steam-plasmoid-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DLIB_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
