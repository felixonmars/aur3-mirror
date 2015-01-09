# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=libgsystem
pkgver=2015.1
pkgrel=1
pkgdesc='"Copylib" for system service modules using GLib with GCC'
arch=(i686 x86_64)
license=(GPL)
depends=(glib2 libsystemd)
makedepends=(gtk-doc systemd)
url='https://wiki.gnome.org/Projects/LibGSystem'
source=(https://github.com/GNOME/libgsystem/archive/v$pkgver.zip)
sha1sums=('2653fd38bf8b2ad09b20ace7a2bbb51b87827140')

build() {
  cd $pkgname-$pkgver
  autoreconf --force --install
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}
