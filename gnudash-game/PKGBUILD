# Maintainer: Martin Habovstiak <martin.habovstiak@gmail.com>
# Maintainer: Peter Polacik <polacik.p@gmail.com>
pkgname=gnudash-game
pkgver=1.1
pkgrel=3
pkgdesc="Extensible logic game, based on Boulder Dash, Hafik, Supaplex etc. Move your avatar to collect valuables and go to end."
arch=('i686')
url="http://www.st.fmph.uniba.sk/~habovstiak6/"
license="GPL3"
depends=('sdl' 'sdl_image')
source="http://www.st.fmph.uniba.sk/~habovstiak6/GnuDash/gnudash-game_1.1_i386.deb"
md5sums=('329bd7cf974fd373d651f1349dcb8ad4')

build() {
	cd "$sourcedir"
	ar x gnudash-game_1.1_i386.deb
	tar -xzf data.tar.gz -C $pkgdir/
}

