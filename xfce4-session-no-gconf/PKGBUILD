# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_rpkgname=xfce4-session
pkgname=${_rpkgname}-no-gconf
pkgver=4.10.0
pkgrel=1
pkgdesc="A session manager for Xfce"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
 # keep xorg-server-utils for https://bugs.archlinux.org/task/21096  'xorg-server-utils'
 # upower for reboot/shutdown/hibernate/suspend
depends=('libxfce4ui' 'libwnck' 'libsm' 'xorg-iceauth' 'upower' 'xorg-xinit' 'hicolor-icon-theme')
makedepends=('intltool' 'xfce4-dev-tools')
optdepends=('fortune-mod: for xfce4-tips')
conflicts=('xfce4-session')
replaces=('xfce4-utils')
provides=('xfce4-session')
options=('!libtool')
install=${_rpkgname}.install
source=(http://archive.xfce.org/src/xfce/${_rpkgname}/4.10/${_rpkgname}-${pkgver}.tar.bz2
        xfce4-session-4.10.0-add-systemd-support.patch)
md5sums=('4768e1a41a0287af6aad18b329a0f230'
         'aa04bfd2ca17f1e8ad6d2e3efba8244b')

build() {
  cd ${srcdir}/${_rpkgname}-${pkgver}

  # https://bugzilla.xfce.org/show_bug.cgi?id=8729
  patch -Np1 -i "$srcdir/xfce4-session-4.10.0-add-systemd-support.patch"

  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib/xfce4 \
	--localstatedir=/var \
	--disable-static \
	--disable-gnome \
	--disable-libgnome-keyring \
	--disable-debug
  make
}

package() {
  cd ${srcdir}/${_rpkgname}-${pkgver}
  make DESTDIR=$pkgdir install
}
