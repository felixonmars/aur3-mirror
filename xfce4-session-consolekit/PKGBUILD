# $Id$
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=xfce4-session-consolekit
_pkgname=xfce4-session
pkgver=4.12.1
pkgrel=1
pkgdesc="A session manager for Xfce, with upower and consolekit2 support"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui>=4.12.1' 'libwnck' 'libsm' 'polkit-consolekit' 'xorg-iceauth'
	 'xorg-xinit' 'xorg-xrdb' 'hicolor-icon-theme' 'consolekit' 'upower=0.9.23')
conflicts=('xfce4-session')
provides=('xfce4-session')
makedepends=('intltool' 'xfce4-dev-tools>=4.12')
optdepends=('gnome-keyring: for keyring support when GNOME compatibility is enabled'
            'xscreensaver: for locking screen with xflock4'
            'gnome-screensaver: for locking screen with xflock4'
            'xlockmore: for locking screen with xflock4'
            'slock: for locking screen with xflock4')
replaces=('xfce-utils')
install=${_pkgname}.install
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('97d7f2a2d0af7f3623b68d1f04091e02913b28f9555dab8b0d26c8a1299d08fd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
