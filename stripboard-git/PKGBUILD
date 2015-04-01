# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=stripboard-git
pkgver=r12.84eff25
pkgrel=1
pkgdesc="This program can be used to design electronics prototyping boards, so-called stripboards."
arch=('i686' 'x86_64')
url="http://automagically.de/stripboard.html"
license=('GPL')
depends=('gtk2' 'cairo' 'librsvg')
makedepends=('gcc' 'git' 'gtk2' 'cairo' 'librsvg')
options=()
conflicts=('stripboard')
provides=('stripboard')
source=("stripboard::git+http://automagically.de/git/stripboard")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/stripboard"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/stripboard"
	
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/stripboard"
	make DESTDIR="$pkgdir" install
}
