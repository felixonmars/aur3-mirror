# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: napa3um <napa3um@gmail.com>

pkgname=mingw32-sqlite3
_amalgamationver=3071000
_amalgamationver2=${_amalgamationver/00/}
pkgver=3.7.10
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw32)"
arch=('any')
license=('custom')
url="http://www.sqlite.org/"
makedepends=('mingw32-w32api' 'mingw32-gcc' 'mingw32-binutils')
source=(http://www.sqlite.org/sqlite-autoconf-$_amalgamationver.tar.gz)
options=(!buildflags !strip !libtool)
md5sums=('9ed2ca93577b58cfa0d01f64b9312ab9')

build() {
  cd ${srcdir}/sqlite-autoconf-${_amalgamationver}

  unset LDFLAGS

  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 --enable-static --enable-shared
  make
  make DESTDIR=${pkgdir} install
  rm -Rf ${pkgdir}/usr/i486-mingw32/share
}

