# Maintainer: Dan Saul aur by cryingwolf at org
pkgname=ude-bill-calculator
_datever=20101006
_miniver=1
pkgver=$_datever.$_miniver
pkgrel=2

pkgdesc="A tool to calculate \"fair\" bill payments between multiple parties."
arch=(any)
url="http://code.google.com/p/ude-bill-calculator/"
license=('GPL3')
source=(http://ude-bill-calculator.googlecode.com/files/$pkgname.src.$pkgver.tar.xz ubc ude-bill-calculator.desktop)
depends=(
			python
			pygobject
			pygtk
			pycairo
			gnome-python-desktop
			)
install='ude-bill-calculator.install'
md5sums=('e8b5b7720caf26947feb9ad75c943c9a'
         '28aa158a6a1b8809110d8daad7a26de2'
         'c41e936ae3808c5f1f0c6b866ca01fec')


build() {
	cd $srcdir/$pkgname
	python2 -m compileall .
	
	mkdir -p $pkgdir/usr/share/ude/bill-calculator
	#cp $srcdir/$pkgname/*.py $pkgdir/usr/share/ude/bill-calculator
	cp $srcdir/$pkgname/*.pyc $pkgdir/usr/share/ude/bill-calculator
	cp $srcdir/$pkgname/*.glade $pkgdir/usr/share/ude/bill-calculator
	
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/ubc $pkgdir/usr/bin
	chmod +x $pkgdir/usr/bin/ubc
	
	mkdir -p $pkgdir/usr/share/applications
	cp $srcdir/ude-bill-calculator.desktop $pkgdir/usr/share/applications
	
	#mkdir -p $pkgdir/usr/share/licenses/ude/media-player
	#cp $srcdir/$pkgname/AUTHORS $pkgdir/usr/share/licenses/ude/media-player
	#cp $srcdir/$pkgname/COPYING $pkgdir/usr/share/licenses/ude/media-player
	#cp $srcdir/$pkgname/INSTALL $pkgdir/usr/share/licenses/ude/media-player
	#cp $srcdir/$pkgname/LICENCE $pkgdir/usr/share/licenses/ude/media-player
	#cp $srcdir/$pkgname/README $pkgdir/usr/share/licenses/ude/media-player
}


