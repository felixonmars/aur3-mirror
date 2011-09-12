# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Maskawanian aur by cryingwolf at org
pkgname=ude-movie-player-media
_datever=20100904
_miniver=1
pkgver=$_datever.$_miniver
pkgrel=1
pkgdesc="Media for ude-movie-player"
arch=(any)
url="http://code.google.com/p/ude-movie-player/"
license=('cc-by-nc-sa')
source=(http://ude-movie-player.googlecode.com/files/$pkgname.src.$pkgver.tar.xz)

md5sums=('fe8a33756c9dc58db42bac83388f37d0')

build() {
	mkdir -p $pkgdir/usr/share/ude/movie-player
	mkdir -p $pkgdir/usr/share/pixmaps
	cp $srcdir/$pkgname/*.svg $pkgdir/usr/share/ude/movie-player
	cp $srcdir/$pkgname/*.svgz $pkgdir/usr/share/ude/movie-player
	cp $srcdir/$pkgname/*.png $pkgdir/usr/share/ude/movie-player
	
	ln -s /usr/share/ude/movie-player/ude-movie-player.svg $pkgdir/usr/share/pixmaps/
	ln -s /usr/share/ude/movie-player/ude-movie-player-32.png $pkgdir/usr/share/pixmaps/
}


