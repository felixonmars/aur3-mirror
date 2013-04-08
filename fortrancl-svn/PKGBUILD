pkgname=fortrancl-svn
pkgrel=3
pkgdesc='An OpenCL interface for Fortran 90 (latest svn revision)'
pkgver=183
arch=('i686' 'x86_64')
url='http://code.google.com/p/fortrancl'
license=('LGPL')
provides=('fortrancl')
depends=('opencl-headers')
makedepends=('make' 'subversion')
source=('svn+http://fortrancl.googlecode.com/svn/trunk' 'Makefile.am')
_svnmod=fortrancl


pkgver() {
	  cd "$SRCDEST"/trunk
	  svnversion | tr -d [A-z]
}


build() {
	#if [ -d $_svnmod/.svn ]; then
	#	(cd $_svnmod && svn up -r $pkgver)
	#else
	#	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	#fi

	cp Makefile.am $srcdir/trunk/src/
	cd $srcdir/trunk
	
	aclocal
	libtoolize
	autoheader
	automake --add-missing
	autoreconf 
	#./configure 
	./configure  --prefix=/usr #FC=ifort FCFLAGS="-O3"
	make -j1 || return 1
	make DESTDIR="$pkgdir" install || return 1
}
md5sums=('SKIP' '6c3a7e87689ea18c43b0fc6ca8d294ac')
