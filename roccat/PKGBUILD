# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=roccat
pkgver=0.9.0
pkgrel=1
pkgdesc="Library with functionality shared by all ROCCAT device specific packages"
arch=('i686' 'x86_64')
url="http://roccat.sourceforge.net"
license=('GPL2')
depends=('udev' 'libcanberra' 'libnotify>=0.7.0' 'hicolor-icon-theme' 'gtk2')
makedepends=('cmake')
optdepends=('kmod-roccat: drivers for roccat devices')
install=roccat.install
source=("http://downloads.sourceforge.net/project/roccat/roccat/roccat-$pkgver.tar.bz2")

md5sums=('2c64172cd81dfcba81f49eaca63cd3be')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc -DLIBDIR=lib
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  chmod 755 "$pkgdir/usr/bin/roccat_macro_editor"
}