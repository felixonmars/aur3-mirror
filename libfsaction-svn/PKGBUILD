# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libfsaction-svn
pkgver=29
pkgrel=1
pkgdesc="Library to perform operations on file systems like delete, copy, move files, create directories..."
arch=('i686' 'x86_64')
url="http://code.google.com/p/libfsaction/"
license=('LGPL')
depends=()
makedepends=('gcc' 'subversion' 'cmake')
options=()
conflicts=('libfsaction')
provides=('libfsaction')
source=()
md5sums=()

_svntrunk=https://libfsaction.googlecode.com/svn/trunk/
_svnmod=libfsaction

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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_svnmod/libfsaction"
	make
}

package() {
	cd "$srcdir/$_svnmod-build"
	make DESTDIR="$pkgdir" install
}

