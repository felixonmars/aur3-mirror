# Based on percona-server aur PKGBUILD by Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Vishnevsky Roman <aka.x0x01@gmail.com>

pkgname=percona-server-sphinxse
pkgver=5.1.51.11.5
_sphinx_ver=1.10-beta
pkgrel=1
pkgdesc="A backwards-compatible drop-in replacement for MySQL that provides improved performance, diagnostics and instrumentation, and manageability of the server with Sphinx Free open-source SQL full-text search engine as MySQL plugin"
backup=('etc/percona/my.cnf')
install=percona.install
depends=('mysql-clients')
conflicts=('mysql')
provides=('mysql')
optdepends=('perl-dbi' 'perl-dbd-mysql')
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.percona.com/software/percona-server/"
makedepends=('tcp_wrappers' 'zlib' 'perl' 'openssl' 'libtool' 'patch')
options=('!libtool')
source=("http://www.percona.com/downloads/Percona-Server-${pkgver%.*.*.*}/Percona-Server-${pkgver%.*.*}-${pkgver#*.*.*.}/source/Percona-Server.tar.gz"
        'percona'
        'my.cnf'
        'skip-abi-check.patch'
        'skip-examples.patch'
        "http://sphinxsearch.com/downloads/sphinx-${_sphinx_ver}.tar.gz")

md5sums=('a683cebe1f5410ed986916d5932d9e5d'
         '243864805611764a7e5883c1dba7afd8'
         '0337741fa9afbe57939993636081a827'
         'a97e574945e19de3908575b956241026'
         '3b04fa47fba82feba18edc0e189845e8'
         '5b52ce9e93a73c66d37bc3a2402f14fa')

build() {
  cp -R ${srcdir}/sphinx-${_sphinx_ver}/mysqlse ${srcdir}/Percona-Server/storage/sphinx
  cd "${srcdir}/Percona-Server"
  sh "${srcdir}/Percona-Server/BUILD/autorun.sh"
  patch -Np0 -i "${srcdir}/skip-abi-check.patch"
  patch -Np0 -i "${srcdir}/skip-examples.patch"
  # CFLAGS/CXXFLAGS as suggested upstream
  CFLAGS="-fPIC ${CFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer" \
  CXXFLAGS="-fPIC ${CXXFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti" \
  ./configure --prefix=/usr \
    --libexecdir=/usr/sbin \
    --localstatedir=/var \
    --sysconfdir=/etc/percona \
    --without-docs \
    --without-readline \
    --with-ssl \
    --with-libwrap \
    --with-charset=utf8 \
    --with-collation=utf8_general_ci \
    --with-extra-charsets=complex \
    --with-embedded-server \
    --with-unix-socket-path=/var/run/mysqld/mysqld.sock \
    --enable-local-infile \
    --with-plugins=partition,archive,blackhole,federated,heap,innobase,innodb_plugin,ndbcluster,sphinx
  make

  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/my.cnf ${pkgdir}/etc/percona/my.cnf
  install -Dm755 ${srcdir}/percona ${pkgdir}/etc/rc.d/percona

  # provided by libmysqlclient
  rm -f ${pkgdir}/usr/bin/{mysql_config,mysql_client_test_embedded,mysqltest_embedded}
  rm -f ${pkgdir}/usr/lib/mysql/libmysqlclient*
  rm -f ${pkgdir}/usr/lib/mysql/libmysqld.a
  rm -f ${pkgdir}/usr/include/mysql/*.h

  # provided by mysql-clients
  rm -f ${pkgdir}/usr/bin/{mysql,mysqladmin,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap}

  # not needed
  rm -rf ${pkgdir}/usr/{mysql-test,sql-bench}
  rm -f ${pkgdir}/usr/lib/mysql/plugin/*.a
}
