# $Id: PKGBUILD 156107 2012-04-14 07:40:10Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
#
#	Custom AUR Package Maintainer: Diogo B. <db_eee.at.hotmail.dot.com>

pkgname=dbus-beta
pkgver=1.6.0
pkgrel=1
pkgdesc="Freedesktop.org message bus system."
url="http://www.freedesktop.org/Software/dbus"
arch=(i686 x86_64)
license=('GPL' 'custom')
depends=("dbus-core-beta>=${pkgver}" 'libx11')
provides=('dbus=1.5.12')
conflicts=('dbus')
optdepends=('systemd: native systemd support')
source=(http://dbus.freedesktop.org/releases/${pkgname}/dbus-${pkgver}.tar.gz
        30-dbus)

md5sums=('16dcae2dd0c76e398381601ac9acdec4'
         '9fafe8b28460aeaa6054309ef4c5ed92')
build() {
  cd "${srcdir}/dbus-${pkgver}"
  ECHO="echo" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=81 \
      --with-system-pid-file=/var/run/dbus.pid \
      --disable-verbose-mode --disable-static \
      --enable-inotify --disable-dnotify \
      --disable-tests --disable-asserts
  make -C tools dbus-launch
}

package() {
  cd "${srcdir}/dbus-${pkgver}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m755 tools/dbus-launch "${pkgdir}/usr/bin/"
  install -m644 doc/dbus-launch.1 "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/etc/X11/xinit/xinitrc.d"
  install -m755 "${srcdir}/30-dbus" "${pkgdir}/etc/X11/xinit/xinitrc.d/"

  install -d -m755 "${pkgdir}/usr/share/licenses/dbus"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/dbus/"
}
