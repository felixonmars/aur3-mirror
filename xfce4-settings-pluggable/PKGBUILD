# Maintainer twa022 <twa022@gmail.com>

pkgname=xfce4-settings-pluggable
_pkgname=xfce4-settings
pkgver=4.6.5
pkgrel=1
pkgdesc="Xfce Settings Manager with Pluggable Dialogs"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
depends=('exo>=0.3.106' 'libnotify>=0.4.5' 'libxfcegui4>=4.6.1' 'libxklavier>=5.0' 'libwnck>=2.30.0')
makedepends=('intltool')
optdepends=('libcanberra: for sound control')
conflicts=('xfce4-settings' 'xfce4-settings-svn' 'xfce4-settings-devel' 'xfce-mcs-manager')
replaces=('xfce-mcs-manager')
provides=("xfce4-settings=${pkgver}")
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2)
         
build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  autoheader || return 1
  autoconf || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static \
	--enable-libxklavier --enable-sound-settings --enable-pluggable-dialogs
  make || return 1
  make DESTDIR=${pkgdir} install
}

md5sums=('f988cb732913b5fbc115ad7105d2231e')
