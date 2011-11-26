# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-dbcp
pkgver=1.4
pkgrel=1
pkgdesc='Database connection pooling services.'
arch=(any)
url='http://commons.apache.org/dbcp'
license=(APACHE)
depends=('java-runtime>=6')
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/dbcp/binaries/commons-dbcp-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-dbcp-${pkgver}/commons-dbcp-${pkgver}.jar ${pkgdir}/usr/share/java/commons-dbcp/commons-dbcp.jar
}
md5sums=('bd272e9611b0d880fd02493377d4691b')
