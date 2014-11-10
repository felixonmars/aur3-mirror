# $Id: PKGBUILD 212320 2014-05-12 18:48:47Z jgc $
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gtk3-noforcedcsd
pkgver=3.14.4
pkgrel=2
pkgdesc="GObject-based multi-platform GUI toolkit (v3)"
arch=(i686 x86_64)
provides=('gtk3')
conflicts=('gtk3')
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo gtk-update-icon-cache libcups libxcursor libxinerama libxrandr libxi
	libxcomposite libxdamage pango shared-mime-info colord at-spi2-atk wayland libxkbcommon
	adwaita-icon-theme json-glib rest)
makedepends=(gobject-introspection python2)
license=(LGPL)
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz
	gtk_3.14_disable_csd_envvar_20141001.diff
	gtk3csd.sh)
sha256sums=('a006c716d723dab0c623491566e3292af84c87d9198a30199051d23cfc7bef2f'
            '83e06d93d380d6f4f04c4ca1fbbaa76c68d1ee8b48b720781e154147774fad23'
            'a0bcdd4701608a36609352525e28e0ad84092959c3b6f7ef692584fc6ed50591')


prepare()
{
    cd "gtk+-$pkgver"
    patch -p1 -i ../gtk_3.14_disable_csd_envvar_20141001.diff
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
    mkdir "$pkgdir/etc/profile.d"
    install -Dm755 ../gtk3csd.sh "$pkgdir/etc/profile.d/gtk3csd.sh"
}
