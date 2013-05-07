# Maintainer: Evan Pitstick <nerdx00 NOSPAM gmail AT com>
# Based on: https://www.archlinux.org/packages/community/x86_64/sakura/

pkgname=sakura-bzr
pkgver=433
pkgver() {
	cd ${srcdir}/${pkgname}
	bzr revno
}
pkgrel=1
pkgdesc="A terminal emulator based on GTK and VTE"
arch=('i686' 'x86_64')
url="https://launchpad.net/sakura"
license=('GPL')
depends=('vte3' 'libxft' 'desktop-file-utils')
makedepends=('cmake' 'bzr')
provides=('sakura')
conflicts=('sakura')
source=("${pkgname}::bzr+https://launchpad.net/${pkgname%-bzr}/trunk")
install=${pkgname}.install
sha1sums=('SKIP')

build() {
	
	cd ${srcdir}/${pkgname}

	# Set default font size a bit smaller
	sed -i 's|#define DEFAULT_FONT "Bitstream Vera Sans Mono 14"|#define DEFAULT_FONT "Bitstream Vera Sans Mono 10"|g' src/sakura.c
 
	# build & install	
	cmake -DCMAKE_INSTALL_PREFIX=/usr . 
	make 
}

package() {
	
	cd ${srcdir}/${pkgname}

	make DESTDIR=${pkgdir} install 
	# extract the keybindings from the installed documentation, rest is only relevant during build time
	awk '/^Keybindings/{f="'${pkgdir}'/usr/share/doc/'${pkgname%-bzr}'/KEYBINDINGS"} f{print > f} /^END/' \
		${pkgdir}/usr/share/doc/${pkgname%-bzr}/INSTALL
	rm ${pkgdir}/usr/share/doc/${pkgname%-bzr}/INSTALL
	
	find "$pkgdir" -type d -name .bzr -exec rm -r '{}' +
}

# vim: ts=4 sts=4 sw=4 noet
