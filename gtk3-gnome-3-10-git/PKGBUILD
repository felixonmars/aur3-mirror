# Maintainer: Yosef Or Boczko <yosefor3@walla.com>

_pkgname=gtk3-gnome-3-10
pkgname=$_pkgname-git
pkgver=3.9.2.96.g864ca76
pkgrel=1
_realver=3.9.3
pkgdesc="GObject-based multi-platform GUI toolkit (v3)"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
install=gtk3.install
depends=("glib2-gnome-3-10>=2.37.2" "gdk-pixbuf2-gnome-3-10>=2.29.1" atk-gnome-3-10 cairo gtk-update-icon-cache libcups libxcursor libxinerama libxrandr libxi libxcomposite libxdamage pango shared-mime-info colord at-spi2-atk-gnome-3-10 wayland libxkbcommon)
makedepends=(git gobject-introspection intltool)
options=('!libtool')
backup=(etc/gtk-3.0/settings.ini)
license=('LGPL')
replaces=('gtk3')
provides=('gtk3' "gtk3=$_realver" "$_pkgname=$_realver")
conflicts=('gtk3')
source=(git://git.gnome.org/gtk+
        settings.ini
        scroller.patch
        switch.patch)
sha256sums=('SKIP'
            'c214d3dcdcadda3d642112287524ab3e526ad592b70895c9f3e3733c23701621'
            'e93a3c06974d9ef82a6f77dc3da8c2c1d143e941de12e3a757a5746ac45dfc9e'
            '84b4e74b1d98bef69b9feb369aabed585a7dde99d05178c30e8e534f66d0d089')
 
 pkgver() {
    cd "$srcdir/gtk+"
    git describe --always | sed 's|-|.|g'
}

build() {
	cd "$srcdir/gtk+"

	patch gtk/gtknotebook.c < ../../scroller.patch
	patch gtk/gtkswitch.c < ../../switch.patch

	CXX=/bin/false ./autogen.sh --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-gtk2-dependency \
		--disable-schemas-compile \
		--enable-x11-backend \
		--enable-broadway-backend \
		--enable-wayland-backend \
		--enable-gtk-doc

	#https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make
	
	cd po
	intltool-update --pot
	msgmerge -o he.po he.po gtk30.pot
	cp he.po "$srcdir"
}

package() {
    cd "$srcdir/gtk+"
    
    make DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir/settings.ini" "$pkgdir/etc/gtk-3.0/settings.ini"
}
