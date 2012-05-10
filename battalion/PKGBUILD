# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=battalion
pkgver=1.4b
pkgrel=2
pkgdesc="Game in which you are a rampaging monster and destroy the city."
arch=(i686 x86_64)
url="http://evlweb.eecs.uic.edu/aej/AndyBattalion.html"
license=('free')
depends=('mesa')

source=(http://evlweb.eecs.uic.edu/aej/BATTALION/battalion1.4b.tar.bz2)
md5sums=('03dc7b2ba34a1626917e0f173c925644')

build() {
  cd $srcdir/${pkgname}${pkgver}
  rm battalion
  make clean
	make || return 1
	
	mkdir -p $pkgdir/usr/bin
	cp battalion $pkgdir/usr/bin
	
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}


