# $Id: PKGBUILD,v 1.10 2008/10/21 22:45:02 BaSh Exp $
# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Perberos <perberos@gmail.com>
pkgname=nautilus2
_tarname=nautilus
pkgver=2.32.2.1
pkgrel=3
pkgdesc="The GNOME shell and file manager."
arch=('i686' 'x86_64')
url="ftp://ftp.gnome.org/pub/GNOME/sources/"
license=('GPL')
depends=('gnome-desktop2' 'libunique')
makedepends=('pkgconfig' 'intltool')
options=('!emptydirs')
conflicts=('nautilus')
install=nautilus.install
source=(ftp://ftp.gnome.org/pub/GNOME/sources/$_tarname/2.32/${_tarname}-${pkgver}.tar.gz)
sha256sums=('956d8f94830cf433dc19335dec6ea8c57a6810fcc117dad7dc1fd0a8a21c54b8')

provides=('nautilus2')
options=('!libtool')

build() {
	cd "$srcdir/$_tarname-$pkgver"

	# fix G_CONST_RETURN deprecated
	sed -i "s/G_CONST_RETURN/const/g" src/nautilus-zoom-action.c

	sed -i "s/G_CONST_RETURN/const/g" libnautilus-private/nautilus-icon-canvas-item.c
	sed -i "s/G_CONST_RETURN/const/g" libnautilus-private/nautilus-icon-info.h
	sed -i "s/G_CONST_RETURN/const/g" libnautilus-private/nautilus-icon-info.c
	sed -i "s/G_CONST_RETURN/const/g" libnautilus-private/nautilus-search-engine-beagle.c

	sed -i "s/G_CONST_RETURN/const/g" eel/eel-i18n.h
	sed -i "s/G_CONST_RETURN/const/g" eel/eel-i18n.c

	sed -i "s/G_CONST_RETURN/const/g" eel/eel-editable-label.h
	sed -i "s/G_CONST_RETURN/const/g" eel/eel-editable-label.c
	sed -i "s/G_CONST_RETURN/const/g" eel/eel-labeled-image.c


	./configure --prefix=/usr --sysconfdir=/etc \
		--localstatedir=/var --disable-static \
		--libexecdir=/usr/lib/${_tarname} \
		--disable-update-mimedb || return 1

	make || return 1
}

package() {
	cd "$srcdir/$_tarname-$pkgver"

	make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1  DESTDIR="${pkgdir}" install || return 1

	install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
	gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain ${pkgname} ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
	rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
