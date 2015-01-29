# Maintainer: ant32 <antreimer@gmail.com>

pkgname=mingw-w64-libmariadbclient
epoch=2
pkgver=2.0.0
pkgrel=2
pkgdesc="MariaDB Client Library for C (mingw-w64)"
arch=(any)
url="https://mariadb.org"
license=("LGPL")
depends=('mingw-w64-crt' 'mingw-w64-openssl' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://ftp.osuosl.org/pub/mariadb/client-native-${pkgver}/src/mariadb_client-${pkgver}-src.tar.gz"
        'fix-libnames-mingw.patch'
        'use_fopen_for_xp_compatibility.patch')
md5sums=('a233181e03d3c307668b4c722d881661'
         '1fc39771ccb99465c1be66dd56379563'
         'f1624e949933b2a774c116d46192a4ec')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/mariadb_client-$pkgver-src/"
  patch -p1 -i ../fix-libnames-mingw.patch
  #patch -p0 -i ../use_fopen_for_xp_compatibility.patch
}

build() { 
  unset LDFLAGS
  cd "$srcdir/mariadb_client-$pkgver-src/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DWITH_EXTERNAL_ZLIB=ON \
      -DWITH_SQLITE=OFF \
      -DWITH_OPENSSL=ON \
      -DWITH_MYSQLCOMPAT=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mariadb_client-$pkgver-src/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ln -s mariadb "$pkgdir"/usr/${_arch}/include/mysql
    ln -s libmariadb.dll.a "$pkgdir"/usr/${_arch}/lib/libmysql.dll.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}