# Maintainer: Gadget3000 <gadget3000 at msn dot com>
#Contributor: Davide Totaro <dvd100@gmail.com>
pkgname=fgrun-svn
pkgver=624
pkgrel=1
pkgdesc="Frontend for FlightGear from svn."
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('subversion' 'automake' 'boost>=1.34.0')
conflicts=('fgrun')
depends=('flightgear-git' 'fltk' 'openscenegraph-svn' 'simgear-git')
url="http://sourceforge.net/projects/fgrun"
source=()
md5sums=()

_svntrunk="https://fgrun.svn.sourceforge.net/svnroot/fgrun/trunk/fgrun/"
_svnmod="fgrun"

build() {

	cd $startdir/src/

	if [ -d $_svnmod/.svn ]
	then
		cd $_svnmod && svn up
	else
		svn co $_svntrunk $_svnmod
	fi

	msg "SVN checkout done or server timeout"

	cd $startdir/src/$_svnmod
	./autogen.sh
	./configure --prefix=/usr --with-fltk=/usr --with-osg=/usr --with-simgear=/usr
		make || return 1
		make DESTDIR=$startdir/pkg install
	}

