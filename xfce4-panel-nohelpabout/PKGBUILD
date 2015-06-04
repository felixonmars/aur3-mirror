# Maintainer: caus909 <contact "at" caus909 "dot" net>
# Based on package of: Evangelos Foutras <evangelos@foutrelis.com>
# The goal of this package is simply to remove the Help and the About menu from xfce-panel. The main purpose of removing these items is for kiosk installations on a locked xfce-panel as theses menus and the logout menus are the only ones which can not be removed on a locked xfce-panel. I chose to not remove the logout menu as you can customize it through polkit.

pkgname=xfce4-panel-nohelpabout
_origname=xfce4-panel
pkgver=4.12.0
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment, help and about menu not showing"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
provides=('xfce4-panel')
conflicts=('xfce4-panel')
depends=('exo' 'garcon' 'libxfce4ui' 'libwnck' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gtk-doc')
install=${_origname}.install
source=("http://archive.xfce.org/src/xfce/${_origname}/${pkgver%.*}/${_origname}-$pkgver.tar.bz2"
        "xfce4-panel.patch")
sha256sums=('30920fc2e2fc26279a82b5261a155c2cc15ab2aa1ced2275684a6ff8261b97b0'
            'b6a127c9f1c1ce467ba98dfb9874a9ac82e1d3063573b201a1bf1d45e9acc474')

prepare() { 
  cd "$srcdir/${_origname}-$pkgver"
  patch -Np1 -i ../xfce4-panel.patch
}
build() {
  cd "$srcdir/${_origname}-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --enable-gtk3 \
    --disable-debug
  make
}

package() {
  cd "$srcdir/${_origname}-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
