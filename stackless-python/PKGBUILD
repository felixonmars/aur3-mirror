# Maintainer: Jerome Rose <jrose.pub at gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=stackless-python
pkgver=3.3.5
pkgrel=1
pkgdesc="Python is a high-level scripting language. Stackless is an experimental implementation that supports continuations, generators, microthreads, and coroutines."
arch=('i686' 'x86_64')
url="http://www.stackless.com"
makedepends=('python')
depends=('bzip2' 'expat' 'gdbm' 'libffi' 'openssl' 'zlib')
optdepents=('tk: for tkinter')
conflicts=('python>=3')
provides=('python=$pkgver')
license=('python')
source="http://www.stackless.com/binaries/stackless-${pkgver//./}-export.tar.bz2"
md5sums=('f3970d783f146ad21bfb6ae7b8cf6f01')

build() {
	cd "$srcdir/stackless-${pkgver//./}-export"
	./configure \
		--prefix=/usr \
		--with-threads \
		--enable-unicode=ucs4 \
		--enable-stacklessfewerregisters
	
	make
}

package() {
	cd "$srcdir/stackless-${pkgver//./}-export"
	make DESTDIR="$pkgdir/" install
	cd "$pkgdir/usr/bin"
	#rm -f 2to3
	ln -s python3 python
	ln -s python3-config python-config
	ln -s pydoc3 pydoc
	ln -s idle3 idle
}
