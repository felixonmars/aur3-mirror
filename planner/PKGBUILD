# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: herb <herb@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=planner
pkgver=0.14.6
pkgrel=2
pkgdesc="Gnome Project Management System"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Planner"
license=('GPL')
depends=('python2' 'libgnomeui' 'libxslt' 'desktop-file-utils' 'hicolor-icon-theme' 'pygtk' 'gtk2' 'gnome-doc-utils' 'gnome-vfs' 'libgnomecanvas' 'gconf' 'libxml2' 'libglade')
makedepends=('pkg-config' 'intltool')
options=('!libtool' '!makeflags' '!emptydirs')
install=planner.install
source=(http://ftp.gnome.org/pub/GNOME/sources/planner/${pkgver%.*}/planner-${pkgver}.tar.xz)
md5sums=('605c589f2c9ec695df0ae79aed3e2e3b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	sed 's#<libedataserver/e-source-list.h>#<libedataserver/libedataserver.h>#g' -i src/planner-eds-plugin.c
	sed 's#<libedataserver/e-source-group.h>##g' -i src/planner-eds-plugin.c
	sed 's#<libedataserver/e-uid.h>##g' -i src/planner-eds-plugin.c
	sed 's#<libecal/e-cal.h>#<libecal/libecal.h>#g' -i src/planner-eds-plugin.c
	sed 's#<libebook/e-book.h>#<libebook/libebook.h>#g' -i src/planner-eds-plugin.c

	export PYTHON=/usr/bin/python2
	
	./configure --prefix=/usr --sysconfdir=/etc \
			--localstatedir=/var --disable-update-mimedb \
			--enable-python
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
	install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
	gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain planner ${pkgdir}/etc/gconf/schemas/*.schemas
	rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

