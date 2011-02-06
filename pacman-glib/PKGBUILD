# Maintainer: kdas <keshto@gmail.com>

pkgname=pacman-glib
pkgver=3.4.0
pkgrel=3
pkgdesc='GLib library for Arch Linux package management'
arch=('i686' 'x86_64')
url="https://github.com/PirateJonno/pacman-glib/"
license=('GPL')
depends=('pacman>=3.4.0' 'pacman<3.5.0' 'glib2')
makedepends=('gnome-common' 'gtk-doc' 'intltool')
source=(https://github.com/PirateJonno/${pkgname}/tarball/v${pkgver})
conflicts=(pacman-glib-git)
md5sums=('01a4049bfd7558a404d430ec62ffd901')

build() {
cd ${srcdir}/PirateJonno-${pkgname}-4f3442e
	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
	make -s || return 1
	make -s DESTDIR=${pkgdir} install
}
