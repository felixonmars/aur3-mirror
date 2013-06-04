# Maintainer:   Jesse Jaara     <gmail.com: jesse.jaara>
# Contributor:  Gaetan Bisson   <archlinux.org: bisson>
# Contributor:  Eric Bélanger   <archlinux.org: eric>

pkgname=procps-ng-satic
pkgver=3.3.8
pkgrel=1
pkgdesc='Static lib for procps'
url='http://gitorious.org/procps'
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
groups=('base')
makedepends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::http://gitorious.org/procps/procps/archive-tarball/v${pkgver}")
sha1sums=('63aed46ba4b5b05698beb25d2aa3eee6779d7f45')

options=('!libtool')

prepare() {
	cd "${srcdir}/procps-procps"

	echo ${pkgver} > .tarball-version
	./autogen.sh
}

build() {
	cd "${srcdir}/procps-procps"

	./configure \
		--prefix=/usr \
		--exec-prefix=/ \
		--sysconfdir=/etc \
		--libdir=/usr/lib \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--enable-static

	make
}

package() {
	cd "${srcdir}/procps-procps"

	mkdir -p "${pkgdir}/usr/lib/"
	cp proc/.libs/libprocps.a "${pkgdir}/usr/lib/"
}
