# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libreadopt-svn
pkgver=6
pkgrel=2
pkgdesc="A C library to parse command library arguments."
arch=('i686' 'x86_64')
url="http://code.google.com/p/libreadopt/"
license=('LGPL')
depends=()
makedepends=('gcc' 'subversion' 'cmake')
options=()
conflicts=('libreadopt')
provides=('libreadopt')
source=()
md5sums=()

_svntrunk=https://libreadopt.googlecode.com/svn/trunk/
_svnmod=libreadopt

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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_svnmod/libreadopt"
	make
}

package() {
	cd "$srcdir/$_svnmod-build"
	make DESTDIR="$pkgdir" install
}
