pkgname=python34
pkgver=3.4.0rc3
pkgrel=1
pkgdesc="Next generation of the python high-level scripting language"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('tk' 'sqlite' 'valgrind')
optdepends=('tk: for tkinter' 'sqlite')
options=('!makeflags')
source=("http://www.python.org/ftp/python/${pkgver%[abr][c]*}/Python-$pkgver.tar.xz")
sha256sums=('48c99b690eb8f9e6317f1eb760a32b4f5c18a4777f03f0804429f28d3081cf37')

build() {
	cd "$srcdir/Python-$pkgver"

	# FS#23997
	sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

	# Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
	# rather than copies shipped in the tarball
	rm -rf Modules/expat
	rm -rf Modules/zlib
	rm -rf Modules/_ctypes/{darwin,libffi}*

	./configure --prefix=/usr \
		--enable-shared \
		--with-computed-gotos \
		--enable-ipv6 \
		--with-system-expat \
		--with-dbmliborder=gdbm:ndbm \
		--with-system-ffi

	make
}

package() {
	cd "$srcdir/Python-$pkgver"
	# altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
	make DESTDIR="$pkgdir" altinstall maninstall

	# Work around a conflict with 3.3 the 'python' package.
	rm "$pkgdir/usr/lib/libpython3.so"
	rm "$pkgdir/usr/share/man/man1/python3.1"

	# License
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
