# Contributor: Viaken <Viaken@Gmail.com>
pkgname=vxl
pkgver=1.14.0
pkgrel=2
pkgdesc="A set of libraries related to computer vision"
arch=('i686' 'x86_64')
url="http://vxl.sourceforge.net"
license=('custom:BSD')
makedepends=('cmake')
conflicts=('vxl-svn')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/1.14/$pkgname-$pkgver.zip")
md5sums=('0329521f2fda61d2835e7b3c7c1189df')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS:BOOL=ON -DBUILD_TESTING:BOOL=OFF -DCMAKE_CXX_FLAGS="$CXXFLAGS" -DCMAKE_C_FLAGS="$CFLAGS" "$srcdir/$pkgname-$pkgver"

  make || return 1
  make DESTDIR="$pkgdir/" install

  install -Dm644 $srcdir/$pkgname-$pkgver/core/vxl_copyright.h $pkgdir/usr/share/licenses/$pkgname/vxl_copyright.h
}

# vim:set ts=2 sw=2 et:
