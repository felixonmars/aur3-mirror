# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
pkgname=lxdream-hg
pkgver=1295.9067aff5522d
pkgrel=1
pkgdesc='A linux-based emulator for the Sega Dreamcast system.'
arch=('i686' 'x86_64')
url='http://www.lxdream.org/'
license=('GPL')
depends=('gtk2' 'libgl' 'libisofs' 'sdl')
makedepends=('mercurial>=2.1.1')
optdepends=('lirc-utils')
conflicts=('lxdream')
install='lxdream.install'
options=('!makeflags')
source=('glib-fixes.patch' "${pkgname}::hg+http://www.lxdream.org/hg/lxdream")
md5sums=('ce7f049918200dbd4066b74c9a26085b' 'SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo $(hg identify -n).$(hg identify -i)
}

build() {
	cd "${srcdir}/${pkgname}"

	# Fix compile with recent glib.
	patch -p1 -i "${srcdir}/glib-fixes.patch"

	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--enable-shared \
		--with-gtk \
		--with-sdl \
		--without-osmesa \
		--without-esd \
		--without-pulse
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
