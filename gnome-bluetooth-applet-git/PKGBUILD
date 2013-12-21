# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-bluetooth-applet-git
_pkgname=gnome-bluetooth-applet
pkgver=1405.4aadfcf
pkgrel=1
pkgdesc="Systray applet for GNOME Bluetooth"
arch=('i686' 'x86_64')
url="https://github.com/City-busz/gnome-bluetooth-applet"
license=('GPL')
depends=('gnome-bluetooth')
makedepends=('git' 'gnome-common' 'intltool')
optdepends=('gnome-control-center: open settings')
source=(git+https://github.com/City-busz/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
