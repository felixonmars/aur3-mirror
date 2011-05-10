# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=stuntrally-data
pkgver=1.1.1
pkgrel=1
pkgdesc="Stunt Rally game with track editor, based on VDrift and OGRE (data files)"
arch=('any')
license=('GPL3')
url="http://code.google.com/p/vdrift-ogre"
depends=()
source=(http://vdrift-ogre.googlecode.com/files/StuntRally-${pkgver}-data.tar.bz2)
md5sums=('25fb5b4eae2f2ad21734d910108702ce')

build() {
	cd "${srcdir}/data"
}

package() {
	cd "${srcdir}"
	
	mkdir -p "${pkgdir}/usr/share/stuntrally/"
	rm data/CMakeLists.txt
	mv data "${pkgdir}/usr/share/stuntrally/data"
}
