# Maintainer: Jerome Leclanche <jerome.leclanche+arch@gmail.com>

_pkgname=lxinput-qt
pkgname=$_pkgname-git
pkgver=3.c082f73
pkgrel=1
pkgdesc="LXQt keyboard and mouse configuration."
arch=('i686' 'x86_64')
url="http://www.lxde.org"
license=('GPL2')
depends=('qt4')
makedepends=('git' 'cmake')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git://github.com/lxde/$_pkgname.git")
sha256sums=('SKIP')
_gitname=$_pkgname

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "$srcdir/$_gitname"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr  ..
	make
}

package() {
	cd "$srcdir/$_gitname"
	cd build
	make DESTDIR="$pkgdir" install
}
