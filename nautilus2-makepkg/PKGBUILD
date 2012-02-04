# Maintainer: PirateJonno <j@skurvy.no-ip.org>

pkgname=nautilus2-makepkg
tarname=nautilus-makepkg
pkgver=2.30.0
pkgrel=2
pkgdesc='An AUR helper for the nautilus context menu'
arch=('i686' 'x86_64')
url='http://www.gnome.org/'
license=('GPL')
depends=('glib2' 'gconf' 'gnome-desktop2' 'nautilus2' 'pacman')
makedepends=('intltool')
install="${pkgname}.install"
options=('!libtool')
source=("http://cloud.github.com/downloads/PirateJonno/${tarname}/${tarname}-${pkgver}.tar.bz2")
sha256sums=('a2ad3428ea3126a1916206f0091f5a85ed83308a0fccfae39ec69d6b0bf96a7f')

build() {
	cd "${srcdir}/${tarname}-${pkgver}"
	
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var || return 1
	
	make -s || return 1
	make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1
	
	install -m 755 -d "${pkgdir}/usr/share/gconf/schemas"
	gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${tarname}.schemas" "${pkgdir}"/etc/gconf/schemas/*.schemas || return 1
	rm -rf "${pkgdir}/etc"
}
