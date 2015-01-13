# $Id$
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>

pkgname=xfce4-power-manager-pmu
_pkgname=xfce4-power-manager
pkgver=1.4.2
pkgrel=1
pkgdesc="Power manager for Xfce desktop, works with upower-pm-utils"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('xfce4-panel' 'upower-pm-utils' 'libnotify' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=('xfce4-power-manager' 'xfce4-power-manager-upower0')
install=$_pkgname.install
source=(http://archive.xfce.org/src/apps/$_pkgname/1.4/$_pkgname-$pkgver.tar.bz2)
sha256sums=('f28bad9270a155566e5ccf03de91c9cce7516e28192f3c0259a620bbce9d6b97')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-network-manager \
    --enable-polkit \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
