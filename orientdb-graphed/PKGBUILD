# Maintainer:  Neng Xu <neng2.xu2@gmail.com>
# Contributor: Michele Damiano Torelli <me_AT_mdtorelli_DOT_it>

pkgname=orientdb-graphed
pkgver=1.3.0
pkgrel=2
pkgdesc="A NoSQL Graph-Document DBMS - Graph Edition (with TinkerPop Blueprints, Gremlin and Pipes)"
arch=('any')
license=('Apache')
url="http://www.orientdb.org"
depends=('java-runtime-headless')
conflicts=('orientdb' 'orientdb-git' 'orientdb-graphed-git')
install=$pkgname.install
source=("https://s3.amazonaws.com/orientdb/releases/${pkgname}-${pkgver}.tar.gz"
        'orientdb.service')
md5sums=('6326e99f45fce2359062144a923b750a'
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
