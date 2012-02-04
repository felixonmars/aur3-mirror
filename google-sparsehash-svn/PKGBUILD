pkgname=google-sparsehash-svn
pkgver=80
pkgrel=1
pkgdesc="Google's efficient hashmap and hashset implementations for C++ (svn)."
arch=('i686' 'x86_64')
url="http://code.google.com/p/google-sparsehash/"
license=('BSD')
makedepends=('subversion')
conflicts=('google-sparsehash')
source=()
md5sums=()

_svntrunk="http://google-sparsehash.googlecode.com/svn/trunk/"
_svnmod="google-sparsehash-svn"

build() {
	cd $srcdir

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf $srcdir/$_svnmod-build
	cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
	cd $srcdir/$_svnmod-build
	
	./configure --prefix=/usr || return 1
	make || return 1  
	make DESTDIR=$pkgdir install || return 1
}
