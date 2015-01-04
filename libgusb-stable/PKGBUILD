# Maintainer: M0Rf30

_pkgname=libgusb
pkgname=${_pkgname}-stable
pkgver=0.2.3
pkgrel=1
pkgdesc="GLib wrapper around libusb1"
arch=('i686' 'x86_64')
url="https://gitorious.org/gusb/"
license=('LGPL2.1')
conflicts=('libgusb')
replaces=('libgusb')
provides=('libgusb')
depends=('udev' 'libusbx')
makedepends=('gobject-introspection')
source=(http://people.freedesktop.org/~hughsient/releases/${_pkgname}-$pkgver.tar.xz)

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('82b9c0b3ca2d8a3220135f3eb4e88bf4')
