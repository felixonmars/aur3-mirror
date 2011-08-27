# Maintainer: Aleksuk Artyom <h31mail at yandex.com>
# based on "ktorrent" package

pkgname=ktorrent-devel
pkgver=4.1rc1
pkgrel=1
pkgdesc="A BitTorrent program for KDE"
arch=('i686' 'x86_64')
url="http://ktorrent.org"
license=('GPL2')
depends=('libktorrent-devel' 'kdebase-workspace' 'taglib')
makedepends=('automoc4' 'cmake' 'boost')
provides=(ktorrent)
conflicts=(ktorrent)
source=("http://ktorrent.org/downloads/${pkgver}/ktorrent-${pkgver}.tar.bz2")
install=ktorrent.install
options=('libtool')

md5sums=('dc867ace48ed2bf9d21a8f3b95a45866')

build() {
	cd ${srcdir}/ktorrent-${pkgver}

	cd ${srcdir}
	mkdir build
	cd build
	cmake ../ktorrent-${pkgver} \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DENABLE_MEDIAPLAYER_PLUGIN=false
	make
}

package() {
	cd ${srcdir}/build
	make DESTDIR=${pkgdir} install
}
