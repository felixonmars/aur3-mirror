# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=koneplus
pkgver=0.4.0
pkgrel=1
pkgdesc="Userland tool for ROCCAT Kone+"
arch=('i686' 'x86_64')
url="http://roccat.sourceforge.net/koneplus.html"
license=('GPL2')
depends=('roccat>=0.9.0' 'libnotify>=0.7.0' 'libunique')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/roccat/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('2c5a1f833dbb3006eaf7725bff612aeb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|SET(LIBDIR lib64)|SET(LIBDIR lib)|g' cmake_modules/X86.cmake
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -d $pkgdir/usr/share/man
  chmod -R 755 $pkgdir/usr/bin
}


