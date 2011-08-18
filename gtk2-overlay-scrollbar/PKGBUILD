# Maintainer: Constantin Schomburg <me@xconstruct.net>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtk2-overlay-scrollbar
pkgver=2.24.5
pkgrel=3
pkgdesc="The GTK+ Toolkit (v2) with overlay-scrollbar loading patch (Canonical Ayatana Project)"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage' 'heimdal'
         'gnutls' 'shared-mime-info' 'cairo' 'libcups' 'gtk-update-icon-cache')
makedepends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage' 'heimdal' 'gnutls'
             'shared-mime-info' 'cairo' 'libcups' 'gdk-pixbuf2' 'gobject-introspection')
provides=("gtk2=${pkgver}")
conflicts=('gtk2')
backup=(etc/gtk-2.0/gtkrc)
options=('!libtool' '!docs')
install=gtk2.install
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${pkgver}.tar.xz
        xid-collision-debug.patch
        gdk_Make_background_changes_queue_a_repaint.patch
		100_overlay_scrollbar_loading.patch)
sha256sums=('d6b30889efbb9fab9aa598092d08887826a7b2a3069b3bd5155dede28d9866f3'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558'
			'3573af25e8db2fb490b264f80cb9e617ee1a36e767e36e7bb1d830c0b715db93'
			'14e0a0e70970ba9dcff96b181dd1b813acd39433166733308462fc0e62659128')

build() {
    cd "${srcdir}/gtk+-${pkgver}"
    patch -Np1 -i "${srcdir}/xid-collision-debug.patch"
    patch -NRp1 -i "${srcdir}/gdk_Make_background_changes_queue_a_repaint.patch"
	patch -Np1 -i "${srcdir}/100_overlay_scrollbar_loading.patch"

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-xinput=yes

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}
package() {

    cd "${srcdir}/gtk+-${pkgver}"

    make DESTDIR="${pkgdir}" install
    sed -i "s#env python#env python2#" $pkgdir/usr/bin/gtk-builder-convert
    echo 'gtk-fallback-icon-theme = "gnome"' > "${pkgdir}/etc/gtk-2.0/gtkrc"
    #split this out to use with gtk3 too
    rm ${pkgdir}/usr/bin/gtk-update-icon-cache
}
