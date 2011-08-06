# $Id: PKGBUILD 119847 2011-04-15 22:42:57Z ibiru $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-with-xim-patch
pkgver=3.0.12
pkgrel=1
pkgdesc="The GTK+ Toolkit (v3) with an XIM patch, so that XIM based input methods like fcitx can run with gtk3. See the discussion at https://bugzilla.gnome.org/show_bug.cgi?id=645993"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
install=gtk3.install
depends=('atk' 'cairo' 'gtk-update-icon-cache' 'libcups' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage' 'pango' 'shared-mime-info')
makedepends=('gobject-introspection')
options=('!libtool' '!docs')
conflicts=('gtk3')
provides=('gtk3')
backup=(etc/gtk-3.0/settings.ini)
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/3.0/gtk+-${pkgver}.tar.xz
        settings.ini
		xim.patch)

build() {
    cd "${srcdir}/gtk+-${pkgver}"
	patch -p1 < ../xim.patch
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
md5sums=('b9869b671b0fe5905dce2fee57c965cf'
         '085ece008fa3a0b7a72e9fe3dda3631a'
         '0d71538041be3cc326743d2446ece6b8')
