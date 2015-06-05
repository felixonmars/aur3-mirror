# $Id: PKGBUILD 238754 2015-05-09 12:28:18Z bpiotrowski $
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgbase=mariadb-galera
#pkgname=('libmariadbclient' 'mariadb-clients' 'mytop' 'mariadb-galera')
pkgname='mariadb-galera'
pkgver=10.0.19
_pkgver=${pkgver/.a/a}
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url='https://mariadb.com/kb/en/galera/'
makedepends=('cmake' 'openssl' 'zlib' 'libaio' 'libxml2' 'openssl' 'pcre' 'jemalloc' 'galera')
source=(https://downloads.mariadb.org/interstitial/${pkgbase}-$pkgver/source/${pkgbase}-$pkgver.tar.gz
        mariadb.service
        mariadb-post.sh
        mariadb-tmpfile.conf)
sha512sums=('9acba0d851c8bdfe0b28e3ec3dc9a21a41c8f283322d73a3c05ac10b9e9400302b9e6fe47d0d5ef73307254af715bc3ed144acaa325ce6c78841ddd14ee754c7'
            'adab89d2978a9cc249ac56ce62cf4d23b98c0d693fe9f770912e44aef6425624552d8b51b5df226dfe325a6cc8f97f985b4dfd0b961abf08b1b6515b6a470aa2'
            'e20bd243d7d35bcefa802ea222b73b9451cb393fb17bdd2ba3ed2294853e54e06f176f6b6bf16a12f9dcb72b08499a3611712c99064ccbfd6b85b727b69e8ef6'
            '04e7a1b4b1007d8c0a15285408834bf6a9b59fbce55e34fbc52857a90091c0b67c89d032e0ae8a6f990e726bad5a7f53106dff7ba41e09e5ba2ff343d00e486f')

prepare() {
  :
#  sed -i 's/_SVID_SOURCE/_DEFAULT_SOURCE/' \
#    mariadb-$pkgver/storage/tokudb/ft-index/cmake_modules/TokuSetupCompiler.cmake
}

build() {
  mkdir -p build
  cd build

  cmake ../mariadb-$_pkgver \
    -DCMAKE_AR=/usr/bin/gcc-ar \
    -DCMAKE_RANLIB=/usr/bin/gcc-ranlib \
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
    -DWITH_PCRE=system \
    -DWITH_LIBWRAP=OFF \
    -DWITH_JEMALLOC=ON \
    -DCMAKE_EXE_LINKER_FLAGS='-ljemalloc' \
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
    -DCMAKE_C_FLAGS="-fPIC $CFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer -fno-delete-null-pointer-checks" \
    -DCMAKE_CXX_FLAGS="-fPIC $CXXFLAGS -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti -fno-delete-null-pointer-checks" \
    -DWITH_MYSQLD_LDFLAGS="-pie ${LDFLAGS},-z,now"

  make
}

package_libmariadbclient() {
  pkgdesc='MariaDB client libraries'
  depends=('openssl' 'libaio' 'zlib' 'pcre')
  conflicts=('libmysqlclient')
  provides=("libmysqlclient=$pkgver")
  options=('staticlibs')

  cd build
  for dir in include libmysql libmysqld libservices; do
    make -C $dir DESTDIR="$pkgdir" install
  done

  install -Dm755 scripts/mysql_config "$pkgdir"/usr/bin/mysql_config
  install -d "$pkgdir"/usr/share/man/man1
  for man in mysql_config mysql_client_test_embedded mysqltest_embedded; do
    install -m644 "$srcdir"/$pkgbase-$_pkgver/man/$man.1 "$pkgdir"/usr/share/man/man1/$man.1
  done

  rm "$pkgdir"/usr/lib/libmysql{client,client_r,d}.a
}

package_mariadb-clients() {
  pkgdesc='MariaDB client tools'
  depends=('libmariadbclient' 'zlib' 'openssl' 'jemalloc')
  conflicts=('mysql-clients')
  provides=("mysql-clients=$pkgver")

  cd build
  make -C client DESTDIR="$pkgdir" install

  # install man pages
  install -d "$pkgdir"/usr/share/man/man1
  for man in mysql mysqladmin mysqlcheck mysqldump mysqlimport mysqlshow mysqlslap; do
    install -m644 "$srcdir"/$pkgbase-$_pkgver/man/$man.1 "$pkgdir"/usr/share/man/man1/$man.1
  done

  # provided by mariadb
  rm "$pkgdir"/usr/bin/{mysql_{plugin,upgrade},mysqlbinlog,mysqltest}

}

package_mytop() {
  pkgdesc='Top clone for MariaDB'
  depends=('perl' 'perl-dbd-mysql' 'perl-term-readkey')

  cd build
  install -Dm755 scripts/mytop "$pkgdir"/usr/bin/mytop
}

package_mariadb-galera() {
  pkgdesc='Fast SQL database server, drop-in replacement for MySQL with Galera replication'
  backup=('etc/mysql/my.cnf')
  install=mariadb.install
  depends=('mariadb-clients' 'inetutils' 'libaio' 'libxml2' 'pcre' 'galera' 'jemalloc'
           'lz4')
  optdepends=('perl-dbd-mysql: for mysqlhotcopy, mysql_convert_table_format and mysql_setpermission')
  conflicts=('mysql' 'mariadb')
  provides=("mysql=$pkgver" "mariadb=$pkgver")
  options=('emptydirs')

  cd build
  make DESTDIR="$pkgdir" install

  install -Dm644 "$pkgdir"/usr/share/mysql/my-medium.cnf "$pkgdir"/etc/mysql/my.cnf
  install -Dm755 ../mariadb-post.sh "$pkgdir"/usr/bin/mysqld-post
  install -Dm644 ../mariadb.service "$pkgdir"/usr/lib/systemd/system/mysqld.service
  install -Dm644 ../mariadb-tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/mysql.conf

  install -dm700 var/lib/mysql
  chown -R 89:89 var/lib/mysql &>/dev/null

  # provided by libmariadbclient
  cd "$pkgdir"
  rm -f usr/bin/{mysql_config,mysql_client_test_embedded,mysqltest_embedded}
  rm -f usr/lib/libmysql*
  rm -f -r usr/include/
  rm -f usr/share/man/man1/{mysql_config,mysql_client_test_embedded,mysqltest_embedded}.1

  # provided by mariadb-clients
  rm -f usr/bin/{mysql,mysqladmin,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap}
  rm -f usr/share/man/man1/{mysql,mysqladmin,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap}.1

  # provided by mytop
  rm -f usr/bin/mytop

  # not needed
  rm -f -r usr/{data,mysql-test,sql-bench}
  rm -f usr/share/man/man1/mysql-test-run.pl.1
}
