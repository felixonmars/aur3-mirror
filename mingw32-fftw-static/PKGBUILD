# Contributor: archerC <brightcxl@gmail.com>
pkgname=mingw32-fftw-static
pkgver=3.2.2
pkgrel=1
pkgdesc="fftw built with mingw32"
arch=('i686' 'x86_64')
url="http://www.fftw.org"
license=('GPL')
makedepends=(mingw32-gcc)
source=(http://www.fftw.org/fftw-$pkgver.tar.gz)
noextract=()
md5sums=('b616e5c91218cc778b5aa735fefb61ae')

build() {
  cd "$srcdir/fftw-$pkgver"
  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 --enable-static 
  make || return 1
  make DESTDIR="$pkgdir/" install
  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 --enable-static --enable-float
  make || return 1
  make DESTDIR="$pkgdir/" install
  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 --enable-static --enable-long-double
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
