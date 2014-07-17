# Maintainer: Menche <menche_mt at yahoo dot com>

pkgname=procwd
pkgver=20130208.0c9b583
pkgrel=2
pkgdesc="A utility for monitoring processes, restarting them if they die"
url="http://gitorious.org/procwd"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git')
conflicts=()

source=('git+https://gitorious.org/procwd/procwd.git' 'Makefile.patch')
sha256sums=('SKIP' 
		'61002e180f3aa77de6ce9fb03b24d00ea2a17b12e97f9a4527e0843d9936c851')

pkgver() {
	cd "${srcdir}/procwd"
	git log -1 --date=short --format="%cd.%h" | tr -d -
}

prepare() {
	cd "${srcdir}/procwd"
	patch -p1 < ${srcdir}/Makefile.patch
}

build() {
	cd "${srcdir}/procwd"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/procwd"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/etc"
	make DESTDIR="${pkgdir}" install

	mkdir -p "${pkgdir}/usr/share/doc/procwd"
	install README "${pkgdir}/usr/share/doc/procwd"
}
