# Maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

_pkgname=qml-desktop
pkgname=$_pkgname-git
conflicts=("$_pkgname")
pkgver=e5cdc7cd
pkgrel=1
pkgdesc="UNSTABLE: A C++ plugin for QML to access desktop features for Papyros"
arch=("any")
url="https://github.com/papyros/qml-desktop"
license=("LGPL")
depends=("qt5-declarative-git" "libpulse" "glib2")
makedepends=("git")
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/papyros/qml-desktop.git")
sha256sums=("SKIP")

prepare() {
	mkdir -p build
	cd build
	qmake "$srcdir/$_pkgname"
	make
}

package() {
	cd build
	make INSTALL_ROOT="$pkgdir" install
}
