# $Id$
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=xfce4-power-manager-tray
_pkgname=xfce4-power-manager
pkgver=1.2.0
pkgrel=1
pkgdesc="Power manager for Xfce desktop, old version with tray icon"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('xfce4-panel' 'upower=0.9.23' 'udisks' 'libnotify' 'hicolor-icon-theme')
makedepends=('intltool' 'xfce4-dev-tools')
conflicts=('xfce4-power-manager' 'xfce4-power-manager-pmu' 'xfce4-power-manager-upower')
provides=('xfce4-power-manager')
replaces=('xfce4-power-manager-upower0')
install=${_pkgname}.install
source=(http://archive.xfce.org/src/xfce/xfce4-power-manager/1.2/$_pkgname-$pkgver.tar.bz2)
sha1sums=('7efb0ceb37a6d69bd4d0e80d7206161dcf46657a')

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
    --enable-dpms
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
