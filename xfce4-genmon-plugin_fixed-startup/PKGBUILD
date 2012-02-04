# $Id: PKGBUILD 116662 2011-03-24 17:55:38Z andyrtr $
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>

_pkgname=xfce4-genmon-plugin
pkgname=${_pkgname}_fixed-startup
pkgver=3.3.0
pkgrel=1
pkgdesc="plugin that monitors customizable programs stdout for the Xfce4 panel"
arch=(i686 x86_64)
license=('LGPL2.1')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libxfcegui4')
replaces=('xfce4-genmon-plugin')
conflicts=('xfce4-genmon-plugin')
makedepends=('intltool')
options=('!libtool')
source=(http://archive.xfce.org/src/panel-plugins/${pkgname}/3.3/${_pkgname}-${pkgver}.tar.bz2 fix_timer.patch)
md5sums=('7c95234dc99efc21bbf9d2b056dd21f9'
         '4c517081f2bdd4dec0e48a7a1c9afbba')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p1 < ../../fix_timer.patch
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--localstatedir=/var \
	--disable-static \
	--disable-debug
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
