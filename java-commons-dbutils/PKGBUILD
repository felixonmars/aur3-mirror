# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-dbutils
pkgver=1.5
pkgrel=1
pkgdesc='JDBC helper library.'
arch=(any)
url='http://commons.apache.org/dbutils'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/dbutils/binaries/commons-dbutils-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-dbutils-${pkgver}/commons-dbutils-${pkgver}.jar ${pkgdir}/usr/share/java/commons-dbutils/commons-dbutils.jar
}
md5sums=('7bbd5587447d31f097136c57cb7d3eb5')
