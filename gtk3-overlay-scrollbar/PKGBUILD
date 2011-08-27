# Maintainer: Constantin Schomburg <me@xconstruct.net>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-overlay-scrollbar
pkgver=3.0.12
pkgrel=1
pkgdesc="The GTK+ Toolkit (v3) with overlay-scrollbar loading patch (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
install=gtk3.install
depends=('atk' 'cairo' 'gtk-update-icon-cache' 'gnutls' 'heimdal' 'libcups' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage' 'pango' 'shared-mime-info')
makedepends=('gobject-introspection')
provides=("gtk3=${pkgver}")
conflicts=('gtk3')
options=('!libtool' '!docs')
backup=(etc/gtk-3.0/settings.ini)
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/3.0/gtk+-${pkgver}.tar.xz
        settings.ini
		gtk+-3.0-right-filter-window-for-XI2-events.patch
		gtk+-3.0-use-overlay-form-module.patch)
sha256sums=('219fdea120897981840e909fac40d4d433fe061a37b12b9402e215c819ebeae9'
            'c214d3dcdcadda3d642112287524ab3e526ad592b70895c9f3e3733c23701621'
			'43fe524696d62d55d0ea9e8e4665dcfe57f0c1835e2487305c6808c72ec95ddb'
			'f9d035833b945547b517e8f84f80ece13c4cd6013ac980e7d19d57dd8eab369c')

build() {
    cd "${srcdir}/gtk+-${pkgver}"
	patch -Np1 -i "${srcdir}/gtk+-3.0-right-filter-window-for-XI2-events.patch"
	patch -Np1 -i "${srcdir}/gtk+-3.0-use-overlay-form-module.patch"

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-gtk2-dependency \
        --disable-schemas-compile
    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    cd "${srcdir}/gtk+-${pkgver}"
    make DESTDIR="${pkgdir}" install

    install -Dm644 "${srcdir}/settings.ini" "${pkgdir}/etc/gtk-3.0/settings.ini"
}
