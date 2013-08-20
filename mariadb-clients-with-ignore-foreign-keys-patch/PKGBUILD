# $Id: PKGBUILD 193074 2013-08-20 16:08:13Z bhelm $
# based on original mariadb PKGBUILD by Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

_pkgbase=mariadb
pkgname=('mariadb-clients-with-ignore-foreign-keys-patch')
pkgver=5.5.32
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
url='http://mariadb.org/'
makedepends=('cmake' 'openssl' 'zlib')
pkgdesc='MariaDB client tools, mysql and mysqlimport patched with -k / --ignore-foreign-keys option'
depends=('libmariadbclient')
conflicts=('mysql-clients')
provides=("mysql-clients=$pkgver")
options=('!libtool')
source=(http://mirrors.supportex.net/$_pkgbase/$_pkgbase-$pkgver/kvm-tarbake-jaunty-x86/$_pkgbase-$pkgver.tar.gz
	ignore_foreignkey.patch)
sha256sums=('cc76d143c60d9f24b551adaf80f694ef9beb4a6a9032c115a06f7b5c5d0ee468'
            '2675142d604f662f9044f542c6c5db23c7f3f118ffbc7a3f6b4a8179f2f071e9')

build() {
  cd $srcdir/$_pkgbase-$pkgver
  patch -p0 < ../../ignore_foreignkey.patch

  cd $srcdir
  mkdir build || true
  cd build

  cmake ../$_pkgbase-$pkgver \
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
    -DWITH_EMBEDDED_SERVER=OFF \
    -DWITHOUT_SERVER=1 \
    -DWITH_UNIT_TESTS=OFF \
    -DCMAKE_C_FLAGS="-fPIC ${CFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer" \
    -DCMAKE_CXX_FLAGS="-fPIC ${CXXFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti" \
    -DWITH_MYSQLD_LDFLAGS="${LDFLAGS}"


  make 

  cd "$srcdir"/build
  make -C client DESTDIR="$pkgdir" install

  # install man pages
  install -d "$pkgdir"/usr/share/man/man1
  for man in mysql mysqladmin mysqlcheck mysqldump mysqlimport mysqlshow mysqlslap; do
    install -m644 "$srcdir"/$_pkgbase-$pkgver/man/$man.1 "$pkgdir"/usr/share/man/man1/$man.1
  done

  # provided by mariadb
  rm "$pkgdir"/usr/bin/{mysql_{plugin,upgrade},mysqlbinlog,mysqltest}

}
