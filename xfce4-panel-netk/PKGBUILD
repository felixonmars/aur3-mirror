# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xfce4-panel-netk
pkgver=4.6.2
pkgrel=1
pkgdesc="For bringing back the old, more functional pager plugin"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=("libxfcegui4>=4.6.1" 'exo>=0.3.104' 'libwnck' 'hicolor-icon-theme')
makedepends=('pkgconfig' "xfconf>=4.6.1" 'intltool')
replaces=('xfce4-panel')
provices=('xfce4-panel')
options=('!libtool')
install=xfce4-panel.install
source=("http://archive.xfce.org/src/xfce/xfce4-panel/4.6/xfce4-panel-${pkgver}.tar.bz2"
"http://archive.xfce.org/src/xfce/xfce4-panel/4.4/xfce4-panel-4.4.3.tar.bz2")

build() {
  cd ${srcdir}
  rm -rf xfce4-panel-${pkgver}/plugins/pager
  cp -R xfce4-panel-4.4.3/plugins/pager xfce4-panel-${pkgver}/plugins/pager
  cd xfce4-panel-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static #--disable-startup-notification
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
md5sums=('88352816c84cbea57121b0c478976976' '06ef9294062f9bdee4106772e62802f5')
