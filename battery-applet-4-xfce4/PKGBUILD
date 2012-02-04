pkgname=battery-applet-4-xfce4
pkgver=0.9.1
pkgrel=1
pkgdesc="A battery applet for the Xfce4"
arch=(i686 x86_64)
license=('GPL2')
url="http://sourceforge.net/projects/battery-4-xfce4/"
groups=('xfce4-goodies')
depends=('libxfce4util' 'libxfcegui4' 'gtk2' 'xfce4-panel' 'dbus' 'libnotify')
makedepends=('pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/battery-4-xfce4/${pkgname}-${pkgver}.tar.bz2)
md5sums=('3ff7d09d66ce8717bef3f52631890b6f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}