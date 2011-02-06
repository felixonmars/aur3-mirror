pkgname=gosmore-svn
pkgver=23238
pkgrel=1
pkgdesc="Gosmore is a routing and viewer of OSM XML data (SVN Version)"
arch=('i686' 'x86_64')
url="http://wiki.openstreetmap.org/wiki/Gosmore"
license=('GPL')
depends=('gtk' 'libxml2' 'curl')
makedepends=('subversion')
source=()
md5sums=()
provides=('gosmore')
conflicts=('gosmore')
_svntrunk="http://svn.openstreetmap.org/applications/rendering/gosmore/"
_svnmod="gosmore"

build() {
	cd $startdir/src

	# get the sources
	msg "Connecting to $_svntrunk ..."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up) || return 1
	else
		svn co $_svntrunk $_svnmod || return 1
	fi
	msg "SVN checkout done or server timeout"

	rm -rf $startdir/build

        mkdir -p $startdir/build
	cp -r  $startdir/src/* $startdir/build/
        
        cd $startdir/build/$_svnmod

	./configure
	
	make || return 1
	
	make DESTDIR=$startdir/pkg PREFIX=/ install || return 1

#	install -D -m 755 $startdir/src/$_svnmod/src/icons/orig.backGlobe128x128.png $startdir/pkg/usr/share/pixmaps/qlandkartegt.png
#	install -D -m 755 $startdir/qlandkartegt.desktop $startdir/pkg/usr/share/applications/qlandkartegt.desktop
#	install -D -m 755 $startdir/qlandkartegt.menu $startdir/pkg/usr/share/menu/qlandkartegt.menu
}
