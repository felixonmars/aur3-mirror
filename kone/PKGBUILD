# Maintainer: kevku <kevku@gmx.com>
pkgname=kone
pkgver=0.10.1
pkgrel=1
pkgdesc="Userland tool for ROCCAT Kone"
arch=('i686' 'x86_64')
url="http://roccat.sourceforge.net/kone.html"
license=('GPL2')
depends=('roccat' 'libnotify' 'libunique')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/roccat/kone/kone-$pkgver.tar.bz2")
md5sums=('6ef6981e4124ac275593c3285410c890')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|SET(LIBDIR lib64)|SET(LIBDIR lib)|g' cmake_modules/X86.cmake
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  chmod -R 755 $pkgdir/usr/bin
}
