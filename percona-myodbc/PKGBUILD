# Maintainer: Jonathan Gibert <jokot3@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=percona-myodbc
pkgver=5.2.7
pkgrel=1
pkgdesc="ODBC driver/connector for percona server"
arch=(i686 x86_64)
url="http://dev.mysql.com/downloads/connector/odbc/"
depends=('unixodbc' 'libperconaserverclient')
makedepends=('cmake')
license=('GPL')
options=('libtool')
source=("http://cdn.mysql.com/Downloads/Connector-ODBC/5.2/mysql-connector-odbc-$pkgver-src.tar.gz")
md5sums=('4e1e313fd4e2fe46741802b026c4c5fe')

build() {
  cd $srcdir/mysql-connector-odbc-${pkgver}-src
  unset CFLAGS
  export LDFLAGS="-lpthread -ldl"
  cmake -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMYSQL_CONFIG_EXECUTABLE=/usr/bin/perconaserver_config \
    -DMYSQLCLIENT_LIB_NAME=libmysqlclient_r.a \
    -DWITH_UNIXODBC=1 .
  make
}

package() {
  cd "$srcdir/mysql-connector-odbc-${pkgver}-src"
  make DESTDIR="$pkgdir" install
  pushd "$pkgdir/usr"
  rm -rf test
  install -dm0755 share/mysql-connector-odbc
  mv ChangeLog COPYING INSTALL Licenses_for_Third-Party_Components.txt README README.debug \
	share/mysql-connector-odbc/
  popd
}
