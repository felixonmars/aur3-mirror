# $Id$
# Maintainer:

pkgname=xfce4-netload-plugin-bugfix9807
pkgver=1.2.0
pkgrel=1
pkgdesc="A netload plugin for the Xfce panel"
arch=('i686' 'x86_64')
url="http://xfce-goodies.berlios.de/"
license=('GPL')
groups=('xfce4-goodies')
conflicts=('xfce4-netload-plugin')
depends=('xfce4-panel')
makedepends=('intltool')
install=xfce4-netload-plugin.install
source=(http://git.xfce.org/panel-plugins/xfce4-netload-plugin/snapshot/version-$pkgver.tar.bz2)
sha1sums=('6cd639cc294c296761d913768e9af23c3a60bd56')

build() {
  cd "$srcdir/version-$pkgver"

  patch -p1 -i ../../pnin.patch

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-debug
  make
}

package() {
  cd "$srcdir/version-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
