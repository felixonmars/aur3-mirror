# $Id: PKGBUILD 156994 2012-04-23 09:10:49Z ibiru $
# Maintainer: Ionut Biru <ibiru@archlinux.org>
#
#	Custom AUR Package Maintainer: Diogo B. <db_eee.at.hotmail.dot.com>

pkgname=udisks2-mount
pkgver=2.0.0
pkgrel=1
pkgdesc="Disk Management Service, version 2. Polkit mount rules included."
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL2')
depends=('glib2' 'udev' 'polkit' 'libatasmart' 'eject' 'desktop-privileges')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection')
optdepends=('parted: partition management'
            'gptfdisk: GUID partition table support'
	    'systemd: native systemd support')
provides=("udisks2=${pkgver}")
conflicts=('udisks2')
options=(!libtool)
source=(http://udisks.freedesktop.org/releases/udisks-${pkgver}.tar.bz2)

sha256sums=('aa026a5a865688a2e9e430a389c7636c1a556d980539e4bd4a3f31dc5d4fe1eb')

build() {
  cd "udisks-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "udisks-$pkgver"
  make DESTDIR="$pkgdir" install
}
