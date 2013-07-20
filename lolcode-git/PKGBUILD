# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=lolcode-git
pkgver=74.e309811
pkgrel=1
pkgdesc="LOLCODE interpreter written in C."
arch=('i686' 'x86_64')
url="https://github.com/justinmeza/lci"
license=('MIT')
makedepends=('git' 'cmake')
source=("git://github.com/justinmeza/lci.git")
sha256sums=('SKIP')
_gitname="lci"

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "$srcdir/$_gitname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}
