# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=vertigo
pkgver=1.0
pkgrel=2
pkgdesc="An arcade game for testing your reflexes."
arch=('i686' 'x86_64')
url="http://www.vertigo-game.com"
license=('GPL3')
depends=('libxaw' 'openal' 'mesa' 'freetype2' 'libvorbis' 'libxrandr' \
         'zziplib' 'freeimage' 'openal')
if [[ "$CARCH" == "x86_64" ]]; then
depends=('lib32-libxaw' 'lib32-openal' 'lib32-mesa' 'lib32-freetype2' 'lib32-libvorbis' 'lib32-libxrandr' \
	 'lib32-zziplib' 'lib32-freeimage'  'lib32-openal')
fi
source=(http://www.vertigo-game.com/downloads/latest/linux/Vertigo.tar.bz2)

build() {
	cd "${srcdir}/Vertigo"

	mkdir -p "${pkgdir}/opt/vertigo"
	mkdir -p "${pkgdir}/usr/bin"
	## Remove some included libs
	cd lib
	rm  	*freeimage* *freetype* *ogg* *openal* \
		*vorbis* *zip*
	cd ..
	cp -r * "${pkgdir}/opt/vertigo/"
	ln -s /opt/vertigo/bin/play_vertigo.sh "${pkgdir}/usr/bin/vertigo"
}
md5sums=('83eae61947e66da4bd32d3f3bd01a66f')
