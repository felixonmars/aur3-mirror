# Maintainer: Yejun Yang <yejunx At gmail dot com>

pkgbase=webscalesql
pkgname=('webscalesql' 'libwebscalesqlclient' 'webscalesql-clients')
pkgver=5.6.22
pkgrel=1
pkgdesc="We're Gonna Need A Bigger Database"
arch=('i686' 'x86_64')
makedepends=('openssl' 'zlib' 'cmake' 'systemd-tools' 'libxml2' 'libaio' 'pcre' 'jemalloc' 'bison')
license=('GPL')
url="http://webscalesql.org/"
options=('!libtool')
source=("webscalesql::git+https://github.com/webscalesql/webscalesql-5.6.git#branch=${pkgbase}-${pkgver}"
        "webscalesql-post.sh"
        "webscalesql-tmpfile.conf"
        "webscalesql.service")

sha256sums=('SKIP'
            '368f9fd2454d80eb32abb8f29f703d1cf9553353fb9e1ae4529c4b851cb8c5dd'
            '2af318c52ae0fe5428e8a9245d1b0fc3bc5ce153842d1563329ceb1edfa83ddd'
            '188036c4979a4954ae39f2cc950cd67b954045ff96ea36314778737aab28c3b5')
build() {
  rm -rf build
  mkdir build
  cd build

  cmake "../${pkgbase}" \
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

package_libwebscalesqlclient(){
  pkgdesc="WebScaleSQL client libraries"
  depends=('openssl' 'libaio' 'zlib' 'pcre')
  conflicts=('libmariadbclient' 'libmysqlclient')
  provides=("libmariadbclient=${pkgver}" "libmysqlclient=$pkgver")

  cd build
  for dir in include libmysql libmysqld libservices
  do
    make -C "${dir}" DESTDIR="${pkgdir}" install
  done

  install -Dm755 scripts/mysql_config "$pkgdir"/usr/bin/mysql_config
  install -m 755 -d "${pkgdir}/usr/share/man/man1"
  for man in mysql_config mysql_client_test_embedded mysqltest_embedded
  do
    install -m 644 "${srcdir}/${pkgbase}/man/${man}.1" \
      "${pkgdir}/usr/share/man/man1/${man}.1"
  done
}

package_webscalesql-clients(){
  pkgdesc="WebScaleSQL client tools"
  depends=('libwebscalesqlclient' 'zlib' 'openssl' 'jemalloc')
  conflicts=('mariadb-clients' 'mysql-clients')
  provides=("mariadb-clients=${pkgver}" "mysql-clients=$pkgver")

  cd build
  make -C "client" DESTDIR="${pkgdir}" install

  # install man pages
  install -d "${pkgdir}/usr/share/man/man1"
  for man in mysql mysqladmin mysqlcheck mysqldump mysqlimport mysqlshow mysqlslap
  do
    install -m644 "${srcdir}/${pkgbase}/man/${man}.1" \
      "${pkgdir}/usr/share/man/man1/${man}.1"
  done

  # provided by mysql
  rm "$pkgdir"/usr/bin/{mysql_{plugin,upgrade,config_editor},mysqlbinlog,mysqltest}
}

package_webscalesql(){
  pkgdesc="We're Gonna Need A Bigger Database"
  backup=('etc/mysql/my.cnf')
  install="${pkgbase}.install"
  depends=('webscalesql-clients' 'inetutils' 'libaio' 'libxml2' 'pcre' 'jemalloc')
  conflicts=('mariadb' 'mysql')
  provides=("mariadb=${pkgver}" "mysql=$pkgver")
  options=('emptydirs')

  cd build
  make DESTDIR="${pkgdir}" install

  install -m 644 -D "${pkgdir}/usr/share/mysql/my-default.cnf" "${pkgdir}/etc/mysql/my.cnf"
  install -m 755 -D "${srcdir}/webscalesql-post.sh" "${pkgdir}/usr/bin/mysqld-post"
  install -m 644 -D "${srcdir}/webscalesql-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/mysqld.conf"
  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -D "${srcdir}/webscalesql.service" "${pkgdir}/usr/lib/systemd/system/"

  # provided by libmariadbclient
  cd "$pkgdir"
  rm usr/bin/{mysql_config,mysql_client_test_embedded,mysqltest_embedded}
  rm usr/lib/libmysql*
  rm -r usr/include/
  rm usr/share/man/man1/{mysql_config,mysql_client_test_embedded,mysqltest_embedded}.1

  # provided by mariadb-clients
  rm usr/bin/{mysql,mysqladmin,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap}
  rm usr/share/man/man1/{mysql,mysqladmin,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap}.1

  # not needed
  rm -r usr/{data,mysql-test,sql-bench}
  rm usr/share/man/man1/mysql-test-run.pl.1
}

