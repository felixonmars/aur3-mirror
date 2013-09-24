# Maintainer: Yangtse Su <yangtsesu@gmail.com>

pkgname=gnome-clocks-git
_gitname=gnome-clocks
pkgver=3.10.0
pkgrel=1
pkgdesc="Clock application designed for GNOME 3 "
arch=(x86 x86_64)
url="https://live.gnome.org/GnomeClocks"
license=('GPL')
groups=(gnome-extra)
depends=('glib2' 'gtk3' 'libcanberra' 'libgweather' 'gnome-desktop' 'libnotify')
provides=('gnome-clocks')
conflicts=('gnome-clocks')
makedepends=('gnome-common' 'vala')
install=gnome-clocks.install
source=('git://git.gnome.org/gnome-clocks')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr
  make
}
package() {
  cd $_gitname
  make DESTDIR=${pkgdir} install
}
# vim:set ts=2 sw=2 et:
