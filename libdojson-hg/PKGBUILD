# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=libdojson-hg
_hgname=libdojson
pkgver=21
pkgrel=1
pkgdesc="A C library to parse and write JSON files."
arch=('i686' 'x86_64')
url="https://hg.eduardosm.net/public/libdojson"
license=('custom:Simple Public License (SimPL) 2.0')
depends=('devnow-libs-hg')
makedepends=('gcc' 'mercurial' 'cmake' 'devnow-libs-hg')
options=()
conflicts=('libdojson')
provides=('libdojson')
source=("hg+https://hg.eduardosm.net/public/$_hgname")
md5sums=('SKIP')

_hgroot="https://code.google.com/p"
_hgrepo="libdojson"

pkgver() {
	cd "$srcdir/$_hgname"
	echo $(hg identify -n)
}

build() {
	cd "$srcdir"
	
	rm -rf "$srcdir/$_hgname-build"
	mkdir -p "$srcdir/$_hgname-build"
	cd "$srcdir/$_hgname-build"
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_hgname"
	make
}

package() {
	cd "$srcdir/$_hgname-build"
	make DESTDIR="$pkgdir" install
	
	install -Dm644 "$srcdir/$_hgname/COPYING.SimPL" "$pkgdir/usr/share/licenses/$pkgname/COPYING.SimPL"
}
