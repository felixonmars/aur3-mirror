# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=bluetooth-panel-applet-git
_pkgname=bluetooth-panel-applet
pkgver=3.6.0.1399
_pkgver=3.6.0
pkgrel=1
pkgdesc="Systray panel applet for GNOME Bluetooth"
arch=(i686 x86_64)
url="https://github.com/NiceandGently/bluetooth-panel-applet"
license=(GPL)
depends=(gnome-bluetooth)
makedepends=(git gnome-common intltool yelp-tools)
source=(git+https://github.com/NiceandGently/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "$_pkgver.%s" "$(git rev-list --count HEAD)"
}

build() {
  cd $_pkgname
  sed -i '/AM_GNU_GETTEXT/d' configure.ac

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  # Remove conflicting files with gnome-bluetooth
  rm -r "$pkgdir/usr/share/help"
}
