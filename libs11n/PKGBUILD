# Contributor: Thomas Weber <weber.t@gmx.at>
pkgname=libs11n
pkgver=1.2.7
pkgrel=1
pkgdesc="s11n is a C++ library for easily serializing a wide variety of objects."
url="http://s11n.net/"
license=('public domain')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/s11n/libs11n-$pkgver.tar.bz2)
md5sums=('2c214ce3d46a55a0e7a9aacbabdcd068')

build() {
  cd $srcdir/libs11n-$pkgver

  ./configure --prefix=/usr

  sed -i -e 's/mkdirhier/mkdir/g' doc/doxygen/Makefile

  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  cd $srcdir
  mv $pkgdir/usr/share/man $pkgdir/usr/
  rm -dr $pkgdir/usr/share 
}
