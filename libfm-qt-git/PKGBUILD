# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_gitname=pcmanfm-qt
pkgname=libfm-qt-git
pkgver=214.b0174d6
pkgrel=1
pkgdesc="A glib/gio-based lib used to develop file managers. Qt components."
arch=("i686" "x86_64")
url="http://www.lxde.org"
license=("GPL2")
depends=("qt4" "menu-cache")
optdepends=("libexif" "libfm-git")
makedepends=("git" "cmake")
source=("git://git.lxde.org/git/lxde/$_gitname.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "$srcdir/$_gitname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 .
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}
