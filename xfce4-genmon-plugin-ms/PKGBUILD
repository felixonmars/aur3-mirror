# $Id$
# Maintainer:
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>
# Contributor: Nicolas "Bousky" Bouscarle <nicolas.bouscarle (at) centraliens-lille.org>

pkgname=xfce4-genmon-plugin-ms
pkgver=3.4.0
pkgrel=1
pkgdesc="plugin that monitors customizable programs stdout for the Xfce4 panel with period in milliseconds instead of seconds"
arch=('i686' 'x86_64')
license=('LGPL2.1')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel')
conflicts=('xfce4-genmon-plugin')
makedepends=('intltool')
options=('!libtool')
source=(http://archive.xfce.org/src/panel-plugins/xfce4-genmon-plugin/3.4/xfce4-genmon-plugin-$pkgver.tar.bz2)
sha256sums=('b0a5337b49c85623dc89f3c9e47c7374b1d466af2418033d2d6dfc57a9790387')

build() {
  cd "$srcdir/xfce4-genmon-plugin-3.4"

  sed -i  's/(s)/(ms)/'              panel-plugin/config_gui.c
  sed -i  's/ . 1000//'              panel-plugin/main.c
  sed -is 's/(s)/(ms)/;s/(.)$/(ms)/' po/*.po

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/xfce4-genmon-plugin-3.4"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
