# Maintainer: Todd Lunter <tlunter@gmail.com>

_pkg='mariadb'
pkgname='libmariadbclient-oboe'
pkgdesc='MariaDB client libraries'
pkgver=5.5.36
_pkgver=${pkgver/.a/a}
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url='http://mariadb.org/'
depends=('openssl' 'libaio' 'zlib')
conflicts=('libmariadbclient' 'libmysqlclient')
provides=("libmariadbclient=$pkgver" "libmysqlclient=$pkgver")
options=('staticlibs')
makedepends=('cmake' 'openssl' 'zlib' 'libaio')
source=(http://mirrors.supportex.net/$_pkg/$_pkg-$_pkgver/kvm-tarbake-jaunty-x86/$_pkg-$_pkgver.tar.gz
        oboe.patch)
sha256sums=('16f2cc9c219b4fbe0b3e97f14d1ed6fd8b7d377b22b95f31adae91965e36bb0c'
            '465e1cb1265f5eb58e5b8a4775d792efede7a1ecf987b6c22163e13f02c11411')

build() {
  patch -d "$_pkg-$_pkgver" -p1 -i $srcdir/oboe.patch

  mkdir -p build
  cd build

  cmake ../$_pkg-$_pkgver \
    -DBUILD_CONFIG=mysql_release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc/mysql \
    -DMYSQL_DATADIR=/var/lib/mysql \
    -DMYSQL_UNIX_ADDR=/run/mysqld/mysqld.sock \
    -DDEFAULT_CHARSET=utf8 \
    -DDEFAULT_COLLATION=utf8_general_ci \
    -DENABLED_LOCAL_INFILE=ON \
    -DINSTALL_INFODIR=share/mysql/docs \
    -DINSTALL_MANDIR=share/man \
    -DINSTALL_PLUGINDIR=lib/mysql/plugin \
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
    -DWITH_LIBWRAP=OFF \
    -DWITH_EXTRA_CHARSETS=complex \
    -DWITH_EMBEDDED_SERVER=ON \
    -DWITH_ARCHIVE_STORAGE_ENGINE=1 \
    -DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
    -DWITH_INNOBASE_STORAGE_ENGINE=1 \
    -DWITH_PARTITION_STORAGE_ENGINE=1 \
    -DWITH_TOKUDB_STORAGE_ENGINE=1 \
    -DWITHOUT_EXAMPLE_STORAGE_ENGINE=1 \
    -DWITHOUT_FEDERATED_STORAGE_ENGINE=1 \
    -DWITHOUT_PBXT_STORAGE_ENGINE=1 \
    -DCMAKE_C_FLAGS="-fPIC $CFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer" \
    -DCMAKE_CXX_FLAGS="-fPIC $CXXFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti" \
    -DWITH_MYSQLD_LDFLAGS="$LDFLAGS"


  make
}

package() {
  cd build
  for dir in include libmysql libmysqld libservices; do
    make -C $dir DESTDIR="$pkgdir" install
  done

  install -Dm755 scripts/mysql_config "$pkgdir"/usr/bin/mysql_config
  install -d "$pkgdir"/usr/share/man/man1
  for man in mysql_config mysql_client_test_embedded mysqltest_embedded; do
    install -m644 "$srcdir"/$_pkg-$_pkgver/man/$man.1 "$pkgdir"/usr/share/man/man1/$man.1
  done
}
