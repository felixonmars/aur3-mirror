# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

#
# This is the LATEST branch, unlike the STABLE 'musl' package
# also includes both static and shared libraries
#

pkgname=musl-latest
pkgver=1.1.3
pkgrel=2
pkgdesc="An implementation of the C/POSIX standard library - LATEST branch"
arch=('i686' 'x86_64')
url="http://www.musl-libc.org/"
license=('MIT')
conflicts=('musl' 'musl-static' 'musl-git')
options=('staticlibs')
source=(http://www.musl-libc.org/releases/musl-$pkgver.tar.gz)
md5sums=('1628bd4c86b14b90447e1dcf8421aed7')

build() {
  cd "$srcdir/musl-$pkgver"

  # 2014-06-13 v1.1.2 - configure failed without this extra CFLAG
  # 2014-06-25 v1.1.3 - as above
  # 2014-07-06 v1.1.3 - added -fno-stack-protector to prevent some segfaults
  export CFLAGS="${CFLAGS} -fno-toplevel-reorder -fno-stack-protector"

  ./configure --prefix=/usr/musl --bindir=/usr/bin --syslibdir=/usr/lib --libdir=/usr/lib/musl --includedir=/usr/include/musl
  make
}

package() {
  cd "$srcdir/musl-$pkgver"
  make DESTDIR="$pkgdir" install
}
