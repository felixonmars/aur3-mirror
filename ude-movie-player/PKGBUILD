# Maintainer: Maskawanian aur by cryingwolf at org
pkgname=ude-movie-player
_datever=20101019
_miniver=1
pkgver=$_datever.$_miniver
pkgrel=2

pkgdesc="A very simple media player"
arch=(any)
url="http://code.google.com/p/ude-movie-player/"
license=('GPL3')
source=(http://ude-movie-player.googlecode.com/files/$pkgname.src.$pkgver.tar.xz ump ude-movie-player.desktop)
depends=(
			python2
			pygobject
			pygtk
			pycairo
			gnome-python-desktop
			gstreamer0.10
			gstreamer0.10-base
			gstreamer0.10-base-plugins
			gstreamer0.10-good
			gstreamer0.10-good-plugins
			kaa-svn-r4366
			'ude-movie-player-media>=2010904.1'
			)
optdepends=(
			'gstreamer0.10-ugly: file format support'
			'gstreamer0.10-ugly-plugins: file format support'
			'gstreamer0.10-bad: file format support'
			'gstreamer0.10-bad-plugins: file format support'
			)
install='ude-movie-player.install'
md5sums=('7a79c1523e0847769701851da047d775'
         '5fdb49635537578d0a7a628881c93c9b'
         '5d9fb9d0b5f6e2ca90baea03e3f178b6')



build() {
	cd $srcdir/$pkgname
	python2 -m compileall .
	
	mkdir -p $pkgdir/usr/share/ude/movie-player
	#cp $srcdir/$pkgname/*.py $pkgdir/usr/share/ude/movie-player
	cp $srcdir/$pkgname/*.pyc $pkgdir/usr/share/ude/movie-player
	
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/ump $pkgdir/usr/bin
	chmod +x $pkgdir/usr/bin/ump
	
	mkdir -p $pkgdir/usr/share/applications
	cp $srcdir/ude-movie-player.desktop $pkgdir/usr/share/applications
	
	mkdir -p $pkgdir/usr/share/licenses/ude/media-player
	cp $srcdir/$pkgname/AUTHORS $pkgdir/usr/share/licenses/ude/media-player
	cp $srcdir/$pkgname/COPYING $pkgdir/usr/share/licenses/ude/media-player
	cp $srcdir/$pkgname/INSTALL $pkgdir/usr/share/licenses/ude/media-player
	cp $srcdir/$pkgname/LICENCE $pkgdir/usr/share/licenses/ude/media-player
	cp $srcdir/$pkgname/README $pkgdir/usr/share/licenses/ude/media-player
}


