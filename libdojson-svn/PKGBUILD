# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libdojson-svn
pkgver=28
pkgrel=2
pkgdesc="A C library to parse and write JSON files."
arch=('i686' 'x86_64')
url="http://code.google.com/p/libdojson/"
license=('LGPL')
depends=('libreaddata-svn' 'libedstring-svn')
makedepends=('gcc' 'subversion' 'cmake' 're2c' 'libreaddata-svn' 'libedstring-svn')
options=()
conflicts=('libdojson')
provides=('libdojson')
source=()
md5sums=()

_svntrunk=https://libdojson.googlecode.com/svn/trunk/
_svnmod=libdojson

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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_svnmod/libdojson"
	make
}

package() {
	cd "$srcdir/$_svnmod-build"
	make DESTDIR="$pkgdir" install
}
