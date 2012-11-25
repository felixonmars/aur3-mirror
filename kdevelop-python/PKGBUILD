# Maintainer: Phil Schaf <flying-sheep@web.de>

_shortname=kdev-python
pkgname=kdevelop-python
pkgver=1.4.1
pkgrel=1
pkgdesc='Python plugin for KDevelop'
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/devtools/plugins/$_shortname"
license=('GPL')
groups=('kde' 'kdevelop-plugins')
depends=('kdevelop')
makedepends=('kdevelop-pg-qt' 'cmake' 'automoc4')
replaces=('kdevelop-extra-plugins-python-git')
source=("http://download.kde.org/stable/kdevelop/$_shortname/$pkgver/src/$_shortname-v$pkgver.tar.bz2")
sha1sums=('b887811d9a79eee3323cf3ad1be093c5801d31d6')

build() {
	cd "$srcdir/$_shortname-v$pkgver"
	sed -i 's|#!.*python$|&2|' python-src/Parser/asdl_c.py
	
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	
	cmake "../$_shortname-v$pkgver" \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_BUILD_TYPE=RELWITHDEBINFO \
		-DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
		-DCMAKE_INSTALL_PREFIX=/usr
	
	make parser
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir" install
}
