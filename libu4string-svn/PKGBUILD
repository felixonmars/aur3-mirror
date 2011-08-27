# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libu4string-svn
pkgver=8
pkgrel=1
pkgdesc="A library to handle strings which does not end with null character."
arch=('i686' 'x86_64')
url="http://code.google.com/p/libu4string/"
license=('LGPL')
depends=()
makedepends=('gcc' 'subversion' 'cmake')
options=()
conflicts=('libu4string')
provides=('libu4string')
source=()
md5sums=()

_svntrunk=https://libu4string.googlecode.com/svn/trunk/
_svnmod=libu4string

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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_svnmod/libu4string"
	make
}

package() {
	cd "$srcdir/$_svnmod-build"
	make DESTDIR="$pkgdir" install
}
