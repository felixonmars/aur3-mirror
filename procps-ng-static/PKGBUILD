# Maintainer:   Jesse Jaara     <gmail.com: jesse.jaara>
# Contributor:  Gaetan Bisson   <archlinux.org: bisson>
# Contributor:  Eric Bélanger   <archlinux.org: eric>

pkgname=procps-ng-static
pkgver=3.3.9
pkgrel=1
pkgdesc='Static lib for procps'
url='http://gitorious.org/procps'
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
groups=('base')
makedepends=('ncurses')
source=("http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${pkgver}.tar.xz")
options=('!libtool' 'staticlibs')

prepare() {
	cd "${srcdir}/procps-ng-${pkgver}"
	sed 's:<ncursesw/:<:g' -i watch.c
}

build() {
        cd "${srcdir}/procps-ng-${pkgver}"

	./configure \
		--prefix=/usr \
		--exec-prefix=/ \
		--sysconfdir=/etc \
		--libdir=/usr/lib \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--enable-watch8bit \
		--enable-static

	make
}

package() {
        cd "${srcdir}/procps-ng-${pkgver}"

	mkdir -p "${pkgdir}/usr/lib/"
	cp proc/.libs/libprocps.a "${pkgdir}/usr/lib/"
}
md5sums=('0980646fa25e0be58f7afb6b98f79d74')
