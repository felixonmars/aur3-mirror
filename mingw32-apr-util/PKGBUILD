pkgname=mingw32-apr-util
pkgver=1.4.1
pkgrel=4
pkgdesc="The Apache Portable Runtime (mingw32)"
arch=('any')
url="http://apr.apache.org/"
license=('Apache')
depends=('mingw32-runtime' 'mingw32-apr')
makedepends=('mingw32-gcc')
options=('!strip' '!buildflags' '!libtool')
optdepends=('mingw32-libiconv: iconv support'
'mingw32-postgresql: PostgreSQL support'
'mingw32-sqlite3: SQLite3 DBD driver'
'mingw32-expat: External expat support'
'mingw32-openssl: OpenSSL support')
source=("http://ftp.wayne.edu/apache//apr/apr-util-$pkgver.tar.bz2")
md5sums=('52b31b33fb1aa16e65ddaefc76e41151')

build() {
  cd "${srcdir}/apr-util-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --with-apr=/usr/i486-mingw32 \
    --with-crypto \
    --without-freetds # causes compile to fail
  make
}

package() {
  cd "${srcdir}/apr-util-$pkgver/build"

  make DESTDIR=${pkgdir} install
  rm $pkgdir/usr/i486-mingw32/lib/*.exp
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/apr-util-1/*.a
}