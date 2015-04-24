# $Id: PKGBUILD 186282 2013-05-23 19:15:33Z bpiotrowski $
# Maintainer: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

_pkgbase=mariadb
pkgname='lib32-libmariadbclient'
pkgdesc='MariaDB client libraries (32 bit)'
pkgver=10.0.17
_pkgver=${pkgver/.a/a}
pkgrel=1
arch=('x86_64')
license=('GPL')
url='http://mariadb.org/'
makedepends=('cmake' 'gcc-multilib' 'lib32-openssl' 'lib32-zlib' 'lib32-libaio' 'lib32-libxml2' 'lib32-pcre')
depends=('lib32-openssl')
conflicts=('lib32-libmysqlclient')
provides=("lib32-libmysqlclient=$pkgver")
options=('staticlibs' '!libtool')
source=(https://downloads.mariadb.org/interstitial/mariadb-$pkgver/source/mariadb-$pkgver.tar.gz)
sha256sums=('9cd394e99942c3700b13f2bf126895fe587e668bfcaffcfd81f0cd878fc19311')

prepare() {
  sed -i 's/_SVID_SOURCE/_DEFAULT_SOURCE/' \
    $_pkgbase-$pkgver/storage/tokudb/ft-index/cmake_modules/TokuSetupCompiler.cmake
}

build() {
  mkdir -p build
  cd build

  export CFLAGS=-m32
  export CXXFLAGS=-m32
  export LDFLAGS=-m32

  CMAKE_PREFIX_PATH=/usr/lib32 cmake ../$_pkgbase-$pkgver \
    -DCMAKE_AR=/usr/bin/gcc-ar \
    -DCMAKE_RANLIB=/usr/bin/gcc-ranlib \
    -DBUILD_CONFIG=mysql_release \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc/mysql \
    -DMYSQL_DATADIR=/var/lib/mysql \
    -DMYSQL_UNIX_ADDR=/run/mysqld/mysqld.sock \
    -DDEFAULT_CHARSET=utf8 \
    -DDEFAULT_COLLATION=utf8_general_ci \
    -DENABLED_LOCAL_INFILE=ON \
    -DINSTALL_INFODIR=share/mysql/docs \
    -DINSTALL_MANDIR=share/man \
    -DINSTALL_LIBDIR=lib32 \
    -DINSTALL_PLUGINDIR=lib32/mysql/plugin \
    -DINSTALL_SCRIPTDIR=bin \
    -DINSTALL_INCLUDEDIR=include/mysql \
    -DINSTALL_DOCREADMEDIR=share/mysql \
    -DINSTALL_SUPPORTFILESDIR=share/mysql \
    -DINSTALL_MYSQLSHAREDIR=share/mysql \
    -DINSTALL_DOCDIR=share/mysql/docs \
    -DINSTALL_SHAREDIR=share/mysql \
    -DWITH_READLINE=ON \
    -DWITH_ZLIB=system \
    -DWITH_SSL=system \
    -DWITH_PCRE=system \
    -DWITH_LIBWRAP=OFF \
    -DWITH_JEMALLOC=OFF \
    -DWITH_EXTRA_CHARSETS=complex \
    -DWITH_EMBEDDED_SERVER=OFF \
    -DWITHOUT_ARIA_STORAGE_ENGINE=1 \
    -DWITHOUT_ARCHIVE_STORAGE_ENGINE=1 \
    -DWITHOUT_BLACKHOLE_STORAGE_ENGINE=1 \
    -DWITHOUT_CSV_STORAGE_ENGINE=1 \
    -DWITHOUT_EXAMPLE_STORAGE_ENGINE=1 \
    -DWITHOUT_FEDERATED_STORAGE_ENGINE=1 \
    -DWITHOUT_FEDERATEDX_STORAGE_ENGINE=1 \
    -DWITHOUT_PBXT_STORAGE_ENGINE=1 \
    -DWITHOUT_HEAP_STORAGE_ENGINE=1 \
    -DWITHOUT_INNOBASE_STORAGE_ENGINE=1 \
    -DWITHOUT_MARIA_STORAGE_ENGINE=1 \
    -DWITHOUT_MYISAM_STORAGE_ENGINE=1 \
    -DWITHOUT_MYISAMMRG_STORAGE_ENGINE=1 \
    -DWITHOUT_NDB_STORAGE_ENGINE=1 \
    -DWITHOUT_OQGRAPH_STORAGE_ENGINE=1 \
    -DWITHOUT_PARTITION_STORAGE_ENGINE=1 \
    -DWITHOUT_PERFSCHEMA_STORAGE_ENGINE=1 \
    -DWITHOUT_SPHINX_STORAGE_ENGINE=1 \
    -DWITHOUT_TOKUDB_STORAGE_ENGINE=1 \
    -DWITHOUT_XTRADB_STORAGE_ENGINE=1 \
    -DCMAKE_C_FLAGS="-m32 -fPIC $CFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer -fno-delete-null-pointer-checks" \
    -DCMAKE_CXX_FLAGS="-m32 -fPIC $CXXFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti -fno-delete-null-pointer-checks" \
    -DWITH_MYSQLD_LDFLAGS="-pie ${LDFLAGS},-z,now"

  make libmysql
}

package() {
  cd "$srcdir"/build
  for dir in libmysql; do
    make -C $dir DESTDIR="$pkgdir" install
  done
}

