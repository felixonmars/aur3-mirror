# Maintainer:  Neng Xu <neng2.xu2@gmail.com>
# Contributor: Tobias Quinn <tobias@tobiasquinn.com>

pkgname=orientdb-community
pkgver=1.6.2
pkgrel=5
pkgdesc="The Graph-Document NoSQL - Community Edition"
arch=('any')
license=('Apache')
url="http://www.orientdb.org"
depends=('java-runtime-headless')
conflicts=('orientdb' 'orientdb-git' 'orientdb-graphed-git' 'orientdb-graphed')
install=$pkgname.install
source=("https://github.com/nengxu/archlinux-orientdb-community/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  'https://github.com/orientechnologies/orientdb-studio/releases/download/Pre-release/studio.zip'
  'orientdb.service'
  'consolefix.patch')
noextract=("studio.zip")
md5sums=('682e1a20b5651898dc4057650cb25367'
  '25f15357f72faba7ae7bf48c880ca072'
  '11ca04909f55bcf5ff7a4a739a6b89af'
  'bd8a11d5eabc337862ff9276dd31b80a')

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    patch -Np1 -i ../consolefix.patch
}

package() {
  cd ${pkgname}-${pkgver}

  install -dm755 "${pkgdir}"/opt/orientdb
  install -dm700 "${pkgdir}"/opt/orientdb/config
  install -dm700 "${pkgdir}"/opt/orientdb/databases
  install -dm755 "${pkgdir}"/opt/orientdb/bin
  install -dm700 "${pkgdir}"/opt/orientdb/www
  install -dm755 "${pkgdir}"/opt/orientdb/lib
  install -dm755 "${pkgdir}"/opt/orientdb/plugins

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

  install -m644 "${srcdir}"/studio.zip "${pkgdir}"/opt/orientdb/plugins
}
