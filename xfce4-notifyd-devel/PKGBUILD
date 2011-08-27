# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-notifyd-devel
pkgver=0.2.1
pkgrel=1
pkgdesc="notification daemon for the xfce desktop"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://goodies.xfce.org/projects/applications/xfce4-notifyd"
groups=('xfce4-goodies-devel')
depends=('libxfce4ui-devel' 'hicolor-icon-theme')
makedepends=('intltool')
provides=('notification-daemon')
conflicts=('notification-daemon' 'notification-daemon-xfce' 'xfce4-notifyd' 'xfce4-notifyd-git')
replaces=('notification-daemon-xfce')
options=('!libtool')
install=xfce4-notifyd.install
source=(http://archive.xfce.org/src/apps/xfce4-notifyd/0.2/xfce4-notifyd-${pkgver}.tar.bz2)
md5sums=('0a63857901809887b587c73024d1089b')

build() {
  cd ${srcdir}/xfce4-notifyd-${pkgver}
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--localstatedir=/var \
	--disable-static \
	--disable-debug
  make
}

package() {
  cd ${srcdir}/xfce4-notifyd-${pkgver}
  make DESTDIR=${pkgdir} install
}
