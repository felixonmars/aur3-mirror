# $Id$
# Maintainer: Silvio Knizek <killermoehre@gmx.net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-git
pkgver=4.11.4.r4.g961ee14
pkgrel=1
pkgdesc="Settings manager for xfce"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'libxfce4util' 'libxfce4ui>=4.11' 'xfconf')
makedepends=('xfce4-dev-tools' 'git' 'libxrandr' 'upower' 'libnotify' 'libxcursor' 'xf86-input-libinput' 'libxklavier' 'libcanberra')
optdepends=('libxrandr: for XRandR support'
            'upower: for UPower support'
            'libnotify: for desktop notifications'
            'libxcursor: for cursor theme support'
            'xf86-input-libinput: for libinput Xorg driver support'
            'libxklavier: for keyboard layout selection'
            'libcanberra: for sound control in UI'
            )
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("git://git.xfce.org/xfce/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long | sed 's/^xfce4-settings-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --enable-xrandr \
    --enable-upower-glib \
    --enable-libnotify \
    --enable-gio-unix \
    --enable-xcursor \
    --enable-xorg-libinput \
    --enable-libxklavier \
    --enable-pluggable-dialogs \
    --enable-sound-settings \
    --disable-debug
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
