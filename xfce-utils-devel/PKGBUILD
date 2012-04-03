# Maintainer:  cuihao <cuihao dot leo at gmail dot com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

# Original PKGBUILD (extra/xfce-utils):
# $Id: PKGBUILD 138663 2011-09-27 14:33:37Z andyrtr $
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce-utils-devel
_pkgname=xfce-utils
pkgver=4.8.3
pkgrel=1
pkgdesc="(REMOVED SINCE XFCE 4.10) Utilities for Xfce (Development Version)"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
depends=('libxfce4ui' 'libxfce4util' 'dbus-glib' 'hicolor-icon-theme')
makedepends=('intltool')
optdepends=('perl:	for migration scripts'
            'xscreensaver: for locking screen with xflock4'
	    'gnome-screensaver: for locking screen with xflock4'
	    'xlockmore: for locking screen with xflock4')
options=('!libtool')
install=${_pkgname}.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.8/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('03b5fba5f63f4f1a31cc7d3728f3c87e')
sha1sums=('159d445b689ebbf73462a4b4baf5cce4e04afaab')

groups=('xfce4-devel')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--localstatedir=/var \
	--disable-static \
	--enable-dbus \
	--disable-debug \
	--with-vendor-info=ArchLinux # 	--enable-gen-doc \
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
