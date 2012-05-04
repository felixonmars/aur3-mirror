# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=netspeed-applet
_pkgname=netspeed_applet
pkgver=0.16
pkgrel=3
pkgdesc="GNOME applet that shows how much traffic occurs on a specified network device"
arch=('i686' 'x86_64')
url="http://projects.gnome.org/netspeed/"
license=('GPL')
depends=('gnome-panel' 'libgtop' 'wireless_tools' 'xdg-utils')
makedepends=('intltool' 'gnome-doc-utils')
install=$pkgname.install
source=(http://launchpad.net/netspeed/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz
        01_stock_icons.patch
        02_dbus.patch
        03_gtk3.patch)
md5sums=('8ae5f925d29fca9b70a248ad05316877'
         'e1b77676455b42c93a385b22c28eb0e6'
         '69066ec62f861658a12b41fe2f6865fd'
         'e824b8ef31c35ab5fcc13f1e0bc50667')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i "$srcdir/01_stock_icons.patch"
  patch -Np1 -i "$srcdir/02_dbus.patch"
  patch -Np1 -i "$srcdir/03_gtk3.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static --disable-scrollkeeper
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
