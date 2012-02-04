pkgname=libreaddata-svn
pkgver=37
pkgrel=1
pkgdesc="A library to read data from diferent sources (file, memory...)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libreaddata/"
license=('LGPL')
depends=()
makedepends=('gcc' 'subversion' 'cmake')
options=()
conflicts=('libreaddata')
provides=('libreaddata')
source=()
md5sums=()

_svntrunk=https://libreaddata.googlecode.com/svn/trunk/
_svnmod=libreaddata

build() {
	cd "$srcdir"
	
	if [ -d "$_svnmod/.svn" ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk -r $pkgver $_svnmod
	fi
	
	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	
	rm -rf "$srcdir/$_svnmod-build"
	mkdir -p "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_svnmod/libreaddata"
	make
}

package() {
	cd "$srcdir/$_svnmod-build"
	make DESTDIR="$pkgdir" install
}
