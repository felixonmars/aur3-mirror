# Maintainer: Mijo Medvedec <mijo dot medvedec at gmail dot com>

pkgname=zcover
_pkgname=DolphinZCover
pkgver=0.4
pkgrel=1
pkgdesc="Dolphin plugin that generates thumbnails for music folders and movie files"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/ZCover?content=168156"
license=('LGPL3')
depends=('kdebase-runtime' 'kdebase-dolphin' 'qt4' 'mediainfo')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
source=("http://kde-apps.org/CONTENT/content-files/168156-${_pkgname}.tar.gz")
md5sums=('b846ce257f04229fb08ec1b392875921')
sha256sums=('225d47f4fd1964c3c4f350e523ab42a47224d28ff38a01f2e452fe4a0ba83e15')

build() {
	cd "${_pkgname}"
	mkdir build && cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
	..

	make
}

package() {
	cd "${_pkgname}/build"
	make DESTDIR="$pkgdir/" install
}
