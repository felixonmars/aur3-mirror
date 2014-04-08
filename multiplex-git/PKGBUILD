# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=multiplex-git
pkgver=1.1.0.g9e541fe
pkgrel=1
pkgdesc="multi-directional shooter written in D"
arch=('i686' 'x86_64')
url="http://tcptr.github.io/multiplex"
license=('GPL3')
depends=('glfw2' 'mesa' 'openal')
makedepends=('dmd' 'git')
provides=('multiplex')
source=("git://github.com/tcptr/multiplex.git" "git://github.com/tcptr/thino.git" "multiplex.sh")
md5sums=('SKIP'
         'SKIP'
         '86b7b82a4df94681c382a253a6a73224')

pkgver() {
	cd "${srcdir}/multiplex"
	git describe --tags --long | sed 's/^v//' | sed 's/-/./g'
}

prepare() {
	cd "${srcdir}/multiplex"
	git submodule init
	git config submodule.thino.url $srcdir/thino
	git submodule update
}

build() {
	cd "${srcdir}/multiplex"
	sed -i 's/lglfw/lglfw2/' Makefile
	make
}

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/multiplex"
	mkdir -p "${pkgdir}/opt/multiplex/config"
	mkdir -p "${pkgdir}/opt/multiplex/replay"
	cp -R ${srcdir}/multiplex/bin/* "${pkgdir}/opt/multiplex"
	chmod a+rw ${pkgdir}/opt/multiplex/config
	chmod a+rw ${pkgdir}/opt/multiplex/replay
	install multiplex.sh -m644 ${pkgdir}/usr/bin/multiplex
	chmod +x ${pkgdir}/usr/bin/multiplex
}
