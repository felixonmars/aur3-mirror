# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libedstring-svn
pkgver=46
pkgrel=1
pkgdesc="A library to handle strings which does not end with null character."
arch=('i686' 'x86_64')
url="http://code.google.com/p/libedstring/"
license=('LGPL')
depends=()
makedepends=('gcc' 'subversion' 'cmake')
options=()
conflicts=('libedstring')
provides=('libedstring')
source=()
md5sums=()

_svntrunk=https://libedstring.googlecode.com/svn/trunk/
_svnmod=libedstring

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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_svnmod/libedstring"
	make
}

package() {
	cd "$srcdir/$_svnmod-build"
	make DESTDIR="$pkgdir" install
}
