# Maintainer: lgbr <lgbr-archlinux@laserbunny.net>

pkgname=mysql50
pkgver=5.0.90
pkgrel=1
pkgdesc="A fast SQL database server"
arch=(i686 x86_64)
backup=(etc/my.cnf etc/conf.d/mysqld)
depends=("mysql-clients>=${pkgver}" 'tcp_wrappers' 'zlib' 'perl')
makedepends=('libtool' 'patch')
url=('http://www.mysql.com/')
options=('!libtool')
optdepends=('perl-dbi' 'perl-dbd-mysql')
provides=( 'mysql' )
replaces=( 'mysql' )
confilcts=( 'mysql' )
license=('GPL')
install=mysql.install
source=(http://downloads.mysql.com/archives/mysql-5.0/mysql-${pkgver}.tar.gz
        mysqld
        my.cnf)
md5sums=('6d325f2b4a60539699558bc5e4452388'
        '92dac61b92253e0878f27318da1dc45f'
        '0337741fa9afbe57939993636081a827')

build() {
  export CFLAGS="${CFLAGS} -fPIC"
  export CXXFLAGS="${CXXFLAGS} -fPIC"
  cd ${startdir}/src/mysql-${pkgver}

  ./configure --prefix=/usr --libexecdir=/usr/sbin \
  --with-embedded-server \
  --localstatedir=/var --sysconfdir=/etc \
  --without-debug --without-docs --without-readline \
  --enable-local-infile --with-ssl \
  --with-charset=latin1 --with-collation=latin1_general_ci \
  --with-extra-charsets=complex --enable-thread-safe-client \
  --with-libwrap \
  --with-pic \
  --with-plugins=partition,ftexample,archive,blackhole,federated,heap,innobase,ndbcluster

  pushd include || return
  make || return 1
  popd
    
  pushd libmysql
  make link_sources get_password.lo || return
  popd
  
  make || return 1
  make DESTDIR=${startdir}/pkg install

  rm -rf $pkgdir/usr/{mysql-test,sql-bench,lib,include}
  install -D -m644 ../my.cnf ${startdir}/pkg/etc/my.cnf
  install -D -m755 ../mysqld ${startdir}/pkg/etc/rc.d/mysqld
  rm -f ${startdir}/pkg/usr/bin/mysql_config

  # Cleanup files provided by the other packages
  rm -rf $pkgdir/usr/{include,lib}
  # provided by mysql-clients
  rm -f ${pkgdir}/usr/bin/{mysql,mysqladmin,mysqlcheck,mysqldump,mysqlimport,mysqlshow,mysqlslap,mysql_client_test_embedded,mysqltest_embedded}
}
