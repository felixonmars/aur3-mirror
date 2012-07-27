# Contributor: napa3um <napa3um@gmail.com>
pkgname=mingw32-sqlite
_amalgamationver=3071300
pkgver=3.7.13
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw32)"
arch=('any')
license=("custom")
url="http://www.sqlite.org/"
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
source=("http://www.sqlite.org/sqlite-autoconf-$_amalgamationver.tar.gz")
options=(!buildflags !strip !libtool)
conflicts=(mingw32-sqlite3 mingw32-sqlite3-static)
replaces=(mingw32-sqlite3 mingw32-sqlite3-static)
provides=(mingw32-sqlite3 mingw32-sqlite3-static)
md5sums=('c97df403e8a3d5b67bb408fcd6aabd8e')

build() {
  cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"

  unset LDFLAGS

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --enable-static \
    --enable-shared
  make
}

package() {
  cd "${srcdir}/sqlite-autoconf-${_amalgamationver}"
  make DESTDIR=${pkgdir} install
  i486-mingw32-strip "$pkgdir/usr/i486-mingw32/bin/"*.exe
  i486-mingw32-strip -g "$pkgdir/usr/i486-mingw32/lib/"*.a
  rm -rf "${pkgdir}/usr/i486-mingw32/share"
}

