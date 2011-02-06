# Maintainer: AqD <aquila.deus@gmail.com>

pkgname=xfce4-corner-plugin
pkgver=1.0.1
pkgrel=5
pkgdesc="Mac-style menubar corner plugin for xfce panel (4.4+)"
arch=(i686 x86_64)
url="http://aquila.deus.googlepages.com/"
depends=('xfce4-panel>=4.3.99.2')
makedepends=(pkgconfig)
options=(NOLIBTOOL)
license=(LGPL)
source=($pkgname.c \
        $pkgname.desktop)
md5sums=('565eb42f0d48ba515e99fbcb8eb1b125'
         '6cbf28aedb77d05e5b307eabe2326711')

build() {
  cd ${startdir}/src
  gcc -std=c99 -Wall `pkg-config --cflags --libs libxfce4panel-1.0` $CFLAGS $LDFLAGS -o $pkgname $pkgname.c || return 1
  mkdir -p ${startdir}/pkg/usr/libexec/xfce4/panel-plugins
  mkdir -p ${startdir}/pkg/usr/share/xfce4/panel-plugins
  cp -f $pkgname ${startdir}/pkg/usr/libexec/xfce4/panel-plugins/
  cp -f $pkgname.desktop ${startdir}/pkg/usr/share/xfce4/panel-plugins/
}
