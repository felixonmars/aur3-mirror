# Contributor: Maxim Molvinskih <molvinskih@gmail.com>

pkgname=xfce4-panel-cairo
pkgver=4.4.3
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment with cairo transparency patch"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('libxfcegui4>=4.4.3' 'libxfce4mcs>=4.4.3' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'xfce-mcs-manager')
options=('!libtool')
replaces=('xfce4-iconbox' 'xfce4-showdesktop-plugin' 'xfce4-systray' \
          'xfce4-windowlist-plugin' 'xfce4-taskbar-plugin')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2 http://packmanutil.googlecode.com/svn-history/r3543/trunk/pmubuilds/xfce-base/xfce4-panel/files/xfce4-panel-invisibility-1.patch)
md5sums=('06ef9294062f9bdee4106772e62802f5'
         '871dc34e6dd90d9bc91ebae1c6afbcca')
	 
build() {
  cp xfce4-panel-invisibility-1.patch ${srcdir}/${pkgname}-${pkgver}/xfce4-panel-invisibility-1.patch
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -Np0 -i xfce4-panel-invisibility-1.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${pkgdir} install
}
