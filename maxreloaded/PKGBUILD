# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Maintainer: Wesley <rudirennsau at hotmail dot com>

pkgname=maxreloaded
pkgver=0.2.6
pkgrel=1
pkgdesc="Mechanized Assault and eXploration oo clone."
arch=('i686' 'x86_64')
url="http://www.maxthegame.de/"
license=('GPL2')
depends=('sdl_mixer' 'sdl_net' 'gcc-libs')
source=(http://www.maxr.org/downloads/maxr-$pkgver.tar.gz maxr.desktop)
md5sums=('14c6545e4038b8319b132d8aa9929194' 'd99348729a6c591d66092d114948fe3e')

build() {
	cd ${srcdir}/maxr-${pkgver}

	./configure --prefix=/usr || return 1
	make || return 1
}

package(){
	cd ${srcdir}/maxr-${pkgver}

	make DESTDIR=${pkgdir} install || return 1
	mkdir -p ${pkgdir}/usr/share/applications
	cp ../maxr.desktop ${pkgdir}/usr/share/applications
}
