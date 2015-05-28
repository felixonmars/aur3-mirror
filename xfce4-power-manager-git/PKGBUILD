# $Id$
# Maintainer:  Silvio Knizek <killermoehre@gmx.net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>

_pkgname=xfce4-power-manager
pkgname="${_pkgname}-git"
pkgver=1.5.0.r2.g96af26b
pkgrel=1
pkgdesc="Power manager for Xfce desktop"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'upower' 'libnotify' 'hicolor-icon-theme')
optdepends=('xfce4-panel: for the Xfce panel plugin')
makedepends=('intltool' 'xfce4-panel' 'xfce4-dev-tools' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${_pkgname}.install"
source=("git://git.xfce.org/xfce/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^xfce4-power-manager-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-network-manager \
    --enable-polkit \
    --enable-xfce4plugin \
    --disable-debug
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
