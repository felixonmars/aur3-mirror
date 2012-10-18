# Contributor: TheSilent <ilsilente@gmail.com>
arch=('i686' 'x86_64')
pkgname=d2x-xl-svn
pkgver=11776
pkgrel=1
pkgdesc="D2X is a port of Descent 2 to OpenGL. It is an open source project and has received a lot of enhancements compared to Descent 2."
url="http://www.descent2.de"
license=('unknown')
depends=('openmotif' 'sdl' 'sdl_image' 'sdl_mixer' 'sdl_net' 'mesa' 'glu' 'glew' 'directfb')
makedepends=('subversion')
conflicts=('d2x-xl')
provides=('d2x-xl')
source=()
md5sums=()

_svntrunk=https://d2x-xl.svn.sourceforge.net/svnroot/d2x-xl/trunk
_svnmod=d2x-xl
#_svnmod2=trunk

build() {
	  cd $startdir/src

	    if [ -d $_svnmod/.svn ]; then
	        (cd $_svnmod && svn up -r $pkgver)
	    else
	    	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	    fi

	    msg "SVN checkout done or server timeout"
	    msg "Starting make..."

	    cd $_svnmod

	    sh ./autogen.sh --prefix=/usr --sysconfdir=/etc
	    chmod 0755 ./configure
	    ./configure --prefix=/usr --enable-release=yes --enable-debug=no

	    make || return 1
	   
	    make DESTDIR=$startdir/pkg/ install

	    rm -rf $startdir/src/$_svnmod-build
	}
# vim:syntax=sh

