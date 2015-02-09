# $Id$
# Maintainer: zegoti
# Contributor: Silvio Knizek <killermoehre@gmx.net>

_pkgname=xfce4-mailwatch-plugin
pkgname=${_pkgname}-git
pkgver=1.2.0.r60.g5690fe4
pkgrel=1
pkgdesc="Multi-protocol, multi-mailbox mail watcher for the Xfce4 panel"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-mailwatch-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'gnutls' 'libgcrypt')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("git://git.xfce.org/panel-plugins/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/${_pkgname}"

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --enable-unique \
    --disable-debug
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
