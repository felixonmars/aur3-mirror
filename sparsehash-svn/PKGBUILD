pkgname=sparsehash-svn
pkgver=115
pkgrel=1
pkgdesc="Google's efficient hashmap and hashset implementations for C++ (svn)."
arch=('i686' 'x86_64')
url="http://code.google.com/p/sparsehash"
license=('BSD')
makedepends=('subversion')
conflicts=('sparsehash')
provides=('sparsehash')
source=()
md5sums=()

_svntrunk="http://sparsehash.googlecode.com/svn/trunk/"
_svnmod="sparsehash"

build() {
	cd "$srcdir"

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir"/$_svnmod-build
	svn export --quiet "$srcdir"/$_svnmod "$srcdir"/$_svnmod-build
	cd "$srcdir"/$_svnmod-build
	
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/$_svnmod-build
	make DESTDIR="$pkgdir" install
	install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$_svnmod/COPYING
}
