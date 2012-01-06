# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=stuntrally-tracks
pkgver=1.4
pkgrel=1
pkgdesc="Stunt Rally game with track editor, based on VDrift and OGRE (tracks)"
arch=('any')
license=('GPL3')
url="http://code.google.com/p/vdrift-ogre"
depends=()
source=(https://nodeload.github.com/stuntrally/tracks/tarball/1.4)
md5sums=('44507258f4cec4c5b31a1446722e095e')

build() {
	cd "${srcdir}/stuntrally-tracks-b5a8a2d"
	
	cmake -DCMAKE_INSTALL_PREFIX="/usr" .
	make
}

package() {
	cd "${srcdir}/stuntrally-tracks-b5a8a2d"

	make DESTDIR="${pkgdir}/usr/share/stuntrally/" install
}
