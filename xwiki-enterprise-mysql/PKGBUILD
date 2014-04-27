# Maintainer: bouquetf <bouquet.frederic@gmail.com>
pkgname=xwiki-enterprise-mysql
pkgver=5.1.30
pkgrel=1
depends=(xwiki-enterprise)
arch=('any')

pkgdesc="Mysql drivers for xwiki"
url="http://www.xwiki.org/"
license=(GPL)
makedepends=(unzip)
backup=()
options=()

source=(https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${pkgver}.tar.gz)
noextract=()

md5sums=('14f0c0ef505363456e9d4af7a425d14b')

package() {
  install -dm775 ${pkgdir}/usr/share/xwiki-enterprise/lib
  install -Dm775 -g71 -o71 ${srcdir}/mysql-connector-java-${pkgver}/mysql-connector-java-${pkgver}-bin.jar ${pkgdir}/usr/share/xwiki-enterprise/lib
}

post_install() {
  echo "Please edit /etc/xwiki-enterprise/hibernate.cfg.xml according to your configuration"
}

# vim:set ts=2 sw=2 et:

