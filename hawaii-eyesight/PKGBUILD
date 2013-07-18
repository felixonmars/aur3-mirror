# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_modname=eyesight
pkgname=hawaii-${_modname}
pkgver=0.1.1
pkgrel=1
pkgdesc="EyeSight: An image viewing program"
arch=('i686' 'x86_64')
url="http://www.maui-project.org"
license=('GPL2')
depends=('qt5-base' 'qt5-tools')
optdepends=('qt5-svg: for svg support'
            'qt5-imageformats: for mng, tga, tiff, bmp image support')
makedepends=('cmake')
source=("https://github.com/hawaii-desktop/eyesight/archive/v${pkgver}.tar.gz")
md5sums=("ce19f54255c64a871c216138605b34c2")

prepare() {
	mkdir -p build
}

build() {
	export QT_SELECT=git

	cd build
	cmake ../${_modname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
