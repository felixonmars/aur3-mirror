# Maintainer: kevku <kevku@gmx.com>
pkgname=pyra
pkgver=0.7.0
pkgrel=1
pkgdesc="Userland tool for ROCCAT Pyra"
arch=('i686' 'x86_64')
url="http://roccat.sourceforge.net/pyra.html"
license=('GPL2')
depends=('roccat' 'dbus-glib' 'libunique')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/roccat/pyra/pyra-$pkgver.tar.bz2")
md5sums=('d8091477dc0c19dcba655f5b740a8f62')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc -DLIBDIR=lib
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  chmod -R 755 $pkgdir/usr/bin/
}


