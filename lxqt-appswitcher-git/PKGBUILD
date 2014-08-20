# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-appswitcher
pkgname=$_pkgname-git
pkgver=0.7.0.1.g085b8ef
pkgrel=1
pkgdesc="The LXQt application switcher"
arch=("i686" "x86_64" "armv6h")
url="http://lxqt.org"
license=("GPL2")
depends=("liblxqt-git" "lxqt-globalkeys-git" "libx11")
makedepends=("git" "cmake")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/lxde/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT5=true ..
	make
}

package() {
	cd "$srcdir/$_pkgname"
	cd build
	make DESTDIR="$pkgdir" install
}
