# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=fileid-svn
pkgver=86
pkgrel=1
pkgdesc="File type identifier"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fileid/"
license=('LGPL')
depends=('libfsaction-svn' 'libreaddata-svn')
makedepends=('gcc' 'subversion' 'cmake' 're2c' 'libfsaction-svn' 'libreaddata-svn' 'libreadopt-svn')
options=()
conflicts=('fileidcheck' 'libfileid')
provides=('fileidcheck' 'libfileid')
source=()
md5sums=()

_svntrunk=https://fileid.googlecode.com/svn/trunk/
_svnmod=fileid

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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_svnmod/fileid"
	make
}

package() {
	cd "$srcdir/$_svnmod-build"
	make DESTDIR="$pkgdir" install
}
