pkgname=neko-svn
pkgver=2.0.0
pkgrel=1
pkgdesc="A dynamic language and lightweight virtual machine."
arch=('i686', 'x86_64')
url="http://www.nekovm.org"
license=('GPLv2')
groups=('devel')
depends=('apache' 'gc' 'gtk2' 'pcre' 'libmysqlclient' 'sqlite' 'zlib')
makedepends=('pkgconfig' 'setconf' 'apr' 'subversion')
provides=('neko')
conflicts=('neko')
options=('!strip')
source=('install.neko.patch')
sha256sums=('999e85cb77941c908bd4650f9d7177519fb2b35e50cc24f9d8465506c03d8d4f')
build() {
	cd "$srcdir"

	msg2 "Checking out latest svn revision..."
	if [[ -d "$pkgname/.svn" ]]; then
		(cd "$pkgname" && svn up)
	else
		svn co \
			http://nekovm.googlecode.com/svn/trunk/ \
			--config-dir ./ "$pkgname"
	fi

	msg2 "Setting up build directory..."
	rm -rf "$srcdir/$pkgname-build"
	cp -r "$srcdir/$pkgname" "$srcdir/$pkgname-build"
	cd "$srcdir/$pkgname-build"

	setconf Makefile MAKESO '$(CC) -shared'

	sed 's|= -Wall -O3|+=|g;s|-mkdir|mkdir -p|g;/strip/d' -i Makefile
	mkdir -p bin

	[ "$CARCH" = "x86_64" ] && export CFLAGS+=" -D_64BITS"
	patch -p2 -i $srcdir/install.neko.patch --verbose
	make clean
	make libneko
	make neko std
	CFLAGS+=`pkg-config --cflags apr-1` make -j1
}

check() {
	cd "$srcdir/$pkgname-build"
	make test
}

package() {
	cd "$srcdir/$pkgname-build"

	install -d "$pkgdir"/usr/{bin,lib}
	make INSTALL_PREFIX="$pkgdir"/usr install

	find "$pkgdir"/usr/lib -type f -exec chmod 644 {} \;
}