# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=tundradraw
pkgver=22
pkgrel=2
pkgdesc="A cross-platform ANSI drawing program, featuring network connectivity to allow artists to draw together over the Internet."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tundradraw/"
license=('GPL')
depends=('qt')
makedepends=('subversion')
source=()
md5sums=('')

_svntrunk=https://tundradraw.svn.sourceforge.net/svnroot/tundradraw 


build() {
	
	cd "$srcdir"
	svn co $_svntrunk 

	msg "SVN checkout done (or server timeout)"
	msg "Starting make..."

	cd $srcdir/tundradraw/trunk/
	qmake
	make
}

package() {	
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/tundradraw
	
	cp $srcdir/tundradraw/trunk/bin/TundraDraw $pkgdir/usr/bin/tundradraw
	cp -fr $srcdir/tundradraw/trunk/docs $pkgdir/usr/share/tundradraw
	rm -fr $pkgdir/usr/share/tundradraw/docs.svn
	

 #desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/tundradraw/trunk/src/tundraicon.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
	
	install -D -m644 $srcdir/../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}


