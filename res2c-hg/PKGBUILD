# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=res2c-hg
_hgname=res2c
pkgver=2
pkgrel=1
pkgdesc="File to C array converter."
arch=('i686' 'x86_64')
url="https://redmine.edsm.es/projects/res2d/"
license=('custom:Simple Public License (SimPL) 2.0')
depends=()
makedepends=('gcc' 'mercurial' 'cmake' 'make')
options=()
conflicts=('res2c')
provides=('res2c')
source=("hg+https://hg.eduardosm.net/public/$_hgname")
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
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_hgname"
	make
}

package() {
	cd "$srcdir/$_hgname-build"
	make DESTDIR="$pkgdir" install
	
	install -Dm644 "$srcdir/$_hgname/COPYING.SimPL" "$pkgdir/usr/share/licenses/$pkgname/COPYING.SimPL"
}
