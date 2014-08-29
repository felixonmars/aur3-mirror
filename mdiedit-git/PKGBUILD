# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=mdiedit-git
pkgver=500bb1f
pkgrel=2
pkgdesc="Simple text editor with MDI interface. Written in qt5."
arch=('i686' 'x86_64')
url="https://github.com/selairi/mdiedit"
license=('BSD')
depends=('qt5-base')
makedepends=('git' 'cmake')
source=("git://github.com/selairi/mdiedit.git")
sha256sums=('SKIP')
_gitname="mdiedit"

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git describe --always | sed 's/mdiedit-//g' | sed 's/-/./g')
}

build() {
	cd "$srcdir/$_gitname/$_gitname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$_gitname/$_gitname"
	make DESTDIR="$pkgdir/" install
}
