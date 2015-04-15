# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
# Contributor: Ivan Petruk <localizator at ukr dot net>

_pkgname=qt5-webkit
pkgname=$_pkgname-git
pkgver=v5.5.0.alpha1.2.ga49a029
pkgrel=1
pkgdesc="A cross-platform application and UI framework (Webkit)"
arch=("i686" "x86_64")
url="https://qt-project.org/"
license=("GPL3" "LGPL")
depends=("qt5-sensors-git" "gstreamer0.10-base" "libxslt" "libxcomposite") # "qt5-location-git" 
makedepends=("git" "python2")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gitorious.org/qt/qtwebkit.git#branch=5.5")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

prepare() {
	cd "$srcdir/$_gitname"

	sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
		-e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
		$(find . -name "*.py")
	sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
		-e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
		-e "s|python |python2 |" \
		$(find . -name "*.pr?") $(find . -name "*.make")
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir -p build
	cd build
	qmake ..
	make
}

package() {
	cd "$srcdir/$_pkgname"
	cd build
	make INSTALL_ROOT="$pkgdir" install
}
