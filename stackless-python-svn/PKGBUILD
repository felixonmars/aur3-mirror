# Maintainer: Jerome Rose <jrose dot pub at gmail dot com>

pkgname=stackless-python-svn
pkgver=3.2
pkgrel=1
pkgdesc="Python is a high-level scripting language. Stackless is an experimental implementation that supports continuations, generators, microthreads, and coroutines. This is the SVN (maint) version"
arch=('i686' 'x86_64')
url="http://www.stackless.com"
makedepends=('svn')
depends=('bzip2' 'expat' 'gdbm' 'libffi' 'openssl' 'zlib')
optdepents=('tk: for tkinter')
conflicts=('python>=3')
provides=('python=3.2')
license=('python')
#source=
#md5sums=()

build() {
	cd "$srcdir"
	svn checkout "http://svn.python.org/projects/stackless/branches/release${pkgver//./}-maint/"
	cd "$srcdir/release${pkgver//./}-maint"
	./configure \
		--prefix=/usr \
		--with-threads \
		--enable-shared

	make
}

package() {
	cd "$srcdir/release${pkgver//./}-maint"
	make DESTDIR="$pkgdir" install
	cd "$pkgdir/usr/bin"
	rm -f 2to3
	ln -s python3 python
	ln -s python3-config python-config
	ln -s pydoc3 pydoc
	ln -s idle3 idle
}
