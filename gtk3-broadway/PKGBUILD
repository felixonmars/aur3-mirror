# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Simon Ser <simon.ser@emersion.fr>

pkgname=gtk3-broadway
pkgver=3.12.1
pkgrel=1
pkgdesc="Multi-platform toolkit (GTK+ v3), with broadway (in-browser support) enabled"
arch=('x86_64' 'i686')
url="http://www.gtk.org/"
install=gtk3.install
depends=('atk' 'cairo' 'gtk-update-icon-cache' 'libcups' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage' 'pango' 'shared-mime-info' 'colord')
makedepends=('gobject-introspection')
conflicts=('gtk3')
provides=("gtk3=$pkgver")
options=('!libtool')
backup=(etc/gtk-3.0/settings.ini)
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver%.*}/gtk+-$pkgver.tar.xz
        settings.ini wacom.patch)
sha256sums=('719aae5fdb560f64cadb7e968c8c85c0823664de890c9f765ff4c0efeb0277cd'
            'c214d3dcdcadda3d642112287524ab3e526ad592b70895c9f3e3733c23701621'
            '86bda95a14a99d0f596c4ecb2ed715689f71c207c65dfc90a39d4ae7f1c0c0f5')
build() {
  cd "gtk+-$pkgver"

  # Partially revert BGO#673440 in order to fix BGO#674157
  patch -Np1 -i ../wacom.patch

  CXX=/bin/false ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk2-dependency \
    --disable-schemas-compile \
    --enable-x11-backend \
    --enable-broadway-backend
  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "gtk+-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/settings.ini" "$pkgdir/etc/gtk-3.0/settings.ini"
}

# vim:set ts=2 sw=2 et:
