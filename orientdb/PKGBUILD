# Maintainer:  Michele Damiano Torelli <me_AT_mdtorelli_DOT_it>
# Contributor: Gianni Vialetto <gianni at rootcube dot net>

pkgname=orientdb
pkgver=1.5.1
pkgrel=1
pkgdesc="A NoSQL Graph-Document DBMS - Standard edition"
arch=('any')
license=('Apache')
url="http://www.orientdb.org"
depends=('java-runtime-headless')
conflicts=('orientdb-graphed' 'orientdb-git' 'orientdb-graphed-git')
install=$pkgname.install
source=("https://s3.amazonaws.com/orientdb/releases/${pkgname}-${pkgver}.zip"
        'orientdb.service')
md5sums=('e57d1d7ede6ebb043193f2c197772c03'
         '64c40019196576036766e7b92729a741')

package() {
  cd ${pkgname}-${pkgver}

  install -dm755 "${pkgdir}"/opt/orientdb
  install -dm700 "${pkgdir}"/opt/orientdb/config
  install -dm700 "${pkgdir}"/opt/orientdb/databases
  install -dm755 "${pkgdir}"/opt/orientdb/bin
  install -dm700 "${pkgdir}"/opt/orientdb/www
  install -dm755 "${pkgdir}"/opt/orientdb/lib

  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/var/log/orientdb
  install -d "${pkgdir}"/usr/lib/systemd/system

  sed -i 's|\.\./log|/opt/orientdb/log|' config/orientdb-server-log.properties
  sed -i 's|YOUR_ORIENTDB_INSTALLATION_PATH|/opt/orientdb|' bin/orientdb.sh
  sed -i 's|USER_YOU_WANT_ORIENTDB_RUN_WITH|orient|' bin/orientdb.sh

  install -m755 bin/console.sh "${pkgdir}"/opt/orientdb/bin/
  install -m755 lib/* "${pkgdir}"/opt/orientdb/lib/
  install -m700 config/* "${pkgdir}"/opt/orientdb/config/
  install -m700 bin/shutdown.sh bin/server.sh bin/orientdb.sh "${pkgdir}"/opt/orientdb/bin/
  cp -r www/* "${pkgdir}"/opt/orientdb/www/

  install -m644 "${srcdir}"/orientdb.service "${pkgdir}"/usr/lib/systemd/system/
}
