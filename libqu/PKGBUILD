# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de> 
pkgname=libqu
pkgver=1.24.02
pkgrel=1
pkgdesc="A library providing functions and classes for the Qu programming language"
arch=('i686' 'x86_64')
url="http://www.qu-lang.org/"
license=('GPL')
source=(http://www.qu-lang.org/qu-latest.tar.gz)
md5sums=('8df1092c35e52350ba08dfc486eb69b8')

build() {
  cd qu
  ./configure
  cd src
  rm -f qu.o
  mkdir -p $pkgdir/usr/lib
  make libdir=$pkgdir/usr/lib libqu || return 1
  ln -sf libqu.$pkgver.so $pkgdir/usr/lib/libqu.so
}
