# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=mingw32-devnow-libs-hg
_hgname=devnow-libs
pkgver=42
pkgrel=2
pkgdesc="Collection of general purpose C libraries."
arch=('any')
url="https://redmine.edsm.es/projects/devnow-libs/"
license=('custom:Simple Public License (SimPL) 2.0')
depends=('mingw32-runtime')
makedepends=('mingw32-gcc' 'mercurial' 'mingw32-cmake' 'make')
options=()
conflicts=('mingw32-devnow-libs')
provides=('mingw32-devnow-libs')
source=("hg+https://hg.edsm.es/$_hgname")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_hgname"
	echo $(hg identify -n)
}

build() {
	cd "$srcdir"
	
	rm -rf "$srcdir/$_hgname-build"
	mkdir -p "$srcdir/$_hgname-build"
	cd "$srcdir/$_hgname-build"
	
	# Unset these variables or cmake will fail.
	unset CFLAGS
	unset CXXFLAGS
	unset CPPFLAGS
	unset LDFLAGS
	
	i486-mingw32-cmake -DCMAKE_BUILD_TYPE=Release "$srcdir/$_hgname"
	make
}

package() {
	cd "$srcdir/$_hgname-build"
	make DESTDIR="$pkgdir" install
	
	rm -rf "$pkgdir/usr/share"
	#install -Dm644 "$srcdir/$_hgname/COPYING.SimPL" "$pkgdir/usr/share/licenses/$pkgname/COPYING.SimPL"
}
