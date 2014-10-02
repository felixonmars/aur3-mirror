# Maintainer: Adrián Pérez de Castro
pkgname='bar-git'
pkgdesc='A lightweight xcb based bar'
pkgver=v1.0.r28.ge9cdee9
pkgrel=1
license='MIT/X11'
url='https://github.com/LemonBoy/bar'
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')
arch=('x86_64' 'i686')
depends=('libxcb')
makedepends=('perl')
options=('strip' 'zipman')
provides=('bar')
conflicts=('bar')

pkgver () {
	cd "${pkgname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
	cd "${pkgname}"
	make
	make doc
}

package () {
	cd "${pkgname}"
	install -Dm755 bar "${pkgdir}/usr/bin/bar"
	install -Dm644 bar.1 "${pkgdir}/usr/share/man/man1/bar.1"
}
