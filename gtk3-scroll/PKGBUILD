# $Id: PKGBUILD 210499 2014-04-14 20:07:02Z jgc $
# Maintainer: Lukas K.

pkgname=gtk3-scroll
pkgver=3.12.2
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (v3) with mouse wheel support in GtkNotebook and GtkSwitch"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo gtk-update-icon-cache libcups libxcursor libxinerama libxrandr libxi
         libxcomposite libxdamage pango shared-mime-info colord at-spi2-atk wayland libxkbcommon)
makedepends=(gobject-introspection)
optdepends=('gnome-themes-standard: Default widget theme'
            'gnome-icon-theme: Default icon theme')
license=(LGPL)
provides=("gtk3=3.12.2")
conflicts=('gtk3')
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz
        settings.ini notebook_scroll.patch switch.patch )
sha256sums=('61d74eea74231b1ea4b53084a9d6fc9917ab0e1d71b69d92cbf60a4b4fb385d0'
            '14369dfd1d325c393e17c105d5d5cc5501663277bd4047ea04a50abb3cfbd119'
            '2687777f3fe738328a3e7c1816987f7668c6482eba53438bd4b1b6bc9343919c'
            '84b4e74b1d98bef69b9feb369aabed585a7dde99d05178c30e8e534f66d0d089')
prepare() {                        
    cd "gtk+-$pkgver"              
    patch gtk/gtknotebook.c < $srcdir/notebook_scroll.patch
    patch gtk/gtkswitch.c < $srcdir/switch.patch
}  

build() {
    cd "gtk+-$pkgver"
    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-gtk2-dependency \
        --disable-schemas-compile \
        --enable-x11-backend \
        --enable-broadway-backend \
        --enable-wayland-backend

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "gtk+-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
}

