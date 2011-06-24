# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=ttapi-svn
pkgver=7
pkgrel=1
pkgdesc="Library developed in C to access the Tuenti social network."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ttapi/"
license=('LGPL')
depends=('libdojson-svn' 'libu4string-svn' 'libedstring-svn')
makedepends=('gcc' 'subversion' 'cmake' 'libdojson-svn' 'libu4string-svn' 'libedstring-svn')
options=()
conflicts=('ttapi_pm_extractor' 'libttapi')
provides=('ttapi_pm_extractor' 'libttapi')
source=()
md5sums=()

_svntrunk=https://ttapi.googlecode.com/svn/trunk/
_svnmod=ttapi

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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_svnmod/ttapi"
	make
}

package() {
	cd "$srcdir/$_svnmod-build"
	make DESTDIR="$pkgdir" install
}
