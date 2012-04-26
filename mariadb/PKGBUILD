# Maintainer: Brad Arrington <bradla8@yahoo.com>

pkgbase=mariadb
pkgname=mariadb
true && pkgname=('libmariadbclient' 'mariadb-clients' 'mariadb')
pkgver=5.5.23
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.mariadb.org/"
depends=('libedit')
makedepends=('systemtap' 'zlib' 'perl' 'openssl' 'libtool' 'patch')
options=('!strip' '!libtool')
install=mariadb.install
conflicts=('mysql' 'libmysqlclient' 'mysql-clients')

source=("http://mirror.layerjet.com/mariadb/${pkgbase}-${pkgver}/kvm-tarbake-jaunty-x86/${pkgbase}-${pkgver}.tar.gz"
        'my.cnf'
        'mariadbd'
	'mariadb_install_db')


build() {
  cd "${srcdir}"
  mkdir build
  cd build

  # CFLAGS/CXXFLAGS as suggested upstream
  CFLAGS="-fPIC ${CFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer" \
  CXXFLAGS="-fPIC ${CXXFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti" \

  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc/mariadb \
    -DMYSQL_DATADIR=/var/lib/mariadb \
    -DMYSQL_UNIX_ADDR=/var/run/mariadb/mariadb.sock \
    -DDEFAULT_CHARSET=utf8 \
    -DDEFAULT_COLLATION=utf8_general_ci \
    -DENABLED_LOCAL_INFILE=ON \
    -DINSTALL_INFODIR=/usr/share/mariadb/docs \
    -DINSTALL_MANDIR=/usr/share/man \
    -DINSTALL_PLUGINDIR=/usr/lib/mariadb/plugin \
    -DINSTALL_SCRIPTDIR=/usr/bin \
    -DINSTALL_INCLUDEDIR=/usr/include/mariadb \
    -DINSTALL_DOCREADMEDIR=/usr/share/mariadb \
    -DINSTALL_SUPPORTFILESDIR=/usr/share/mariadb \
    -DINSTALL_MYSQLSHAREDIR=/usr/share/mariadb \
    -DINSTALL_DOCDIR=/usr/share/mariadb/docs \
    -DINSTALL_SHAREDIR=/usr/share/mariadb \
    -DWITH_READLINE=ON \
    -DWITH_ZLIB=system \
    -DWITH_SSL=system \
    -DWITH_LIBWRAP=OFF \
    -DWITH_MYSQLD_LDFLAGS="${LDFLAGS}" \
    -DWITH_EXTRA_CHARSETS=complex \
    -DENABLE_DTRACE=1 \
    -DWITH_EMBEDDED_SERVER=ON \
    -DWITH_INNOBASE_STORAGE_ENGINE=1 \
    -DWITH_PARTITION_STORAGE_ENGINE=1 \
    -DWITHOUT_EXAMPLE_STORAGE_ENGINE=1 \
    -DWITHOUT_ARCHIVE_STORAGE_ENGINE=1 \
    -DWITHOUT_BLACKHOLE_STORAGE_ENGINE=1 \
    -DWITHOUT_FEDERATED_STORAGE_ENGINE=1

  make 
#    --with-plugins=partition,pbxt,ibmdb2i,aria

}

package_libmariadbclient(){
  pkgdesc="MariaDB client libraries"
  depends=('openssl')
  
  cd "${srcdir}"/build
  for dir in include libmysql libmysqld libservices; do
    make -C ${dir} DESTDIR="${pkgdir}" install
  done

  install -d "${pkgdir}"/usr/bin
  install -m755 scripts/mysql_config "${pkgdir}"/usr/bin/
  install -d "${pkgdir}"/usr/share/man/man1
  for man in mysql_config mysql_client_test_embedded mysqltest_embedded; do
    install -m644 "${srcdir}"/${pkgbase}-${pkgver}/man/$man.1 "${pkgdir}"/usr/share/man/man1/$man.1
  done
}

package_mariadb-clients(){
  pkgdesc="MariaDB client tools"
  depends=('libmysqlclient')
  
  cd "${srcdir}"/build
  make -C client DESTDIR="${pkgdir}" install

  # install man pages
  install -d "${pkgdir}"/usr/share/man/man1
  for man in mysql mysqladmin mysqlcheck mysqldump mysqlimport mysqlshow mysqlslap; do
    install -m644 "${srcdir}"/${pkgbase}-${pkgver}/man/$man.1 "${pkgdir}"/usr/share/man/man1/$man.1
  done

  # provided by mysql
  rm "${pkgdir}"/usr/bin/{mysql_{plugin,upgrade},mysqlbinlog,mysqltest}
}

package_mariadb(){
 pkgdesc="A fast SQL database server"
  backup=('etc/mariadb/my.cnf')
  install=mariadb.install
  depends=('mariadb-clients')
  optdepends=('perl-dbi' 'perl-dbd-mysql')
  options=('emptydirs')

  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/my.cnf "${pkgdir}"/etc/mariadb/my.cnf
  install -Dm755 "${srcdir}"/mariadbd "${pkgdir}"/etc/rc.d/mariadb

  # provided by libmysqlclient
  rm "${pkgdir}"/usr/bin/{mysql_config,mysql_client_test_embedded,mysqltest_embedded}
  rm "${pkgdir}"/usr/lib/libmysql*
  rm -r "${pkgdir}"/usr/include/
  rm "${pkgdir}"/usr/share/man/man1/{mysql_config,mysql_client_test_embedded,mysqltest_embedded}.1
  
  # provided by mariadb-clients
  rm "${pkgdir}"/usr/bin/{mysql,mysqladmin,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap}
  rm "${pkgdir}"/usr/share/man/man1/{mysql,mysqladmin,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap}.1

  # not needed
  rm -r "${pkgdir}"/usr/{data,mysql-test,sql-bench}
  rm "${pkgdir}"/usr/share/man/man1/mysql-test-run.pl.1

  install -dm700 "${pkgdir}"/var/lib/mariadb
}

md5sums=('7074fa091b3c1489f45a5ddf12cd5e6f'
         '372e35c8e655e96c43a4a6aa452efd92'
         '4c491570ec9f2db20b080082119a1714'
         '748fe56c33f26e33a6319a55e0786dbf')
