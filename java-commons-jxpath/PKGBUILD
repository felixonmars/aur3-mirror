# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-jxpath
pkgver=1.3
pkgrel=1
pkgdesc='Utilities for manipulating Java Beans using the XPath syntax.'
arch=(any)
url='http://commons.apache.org/jxpath'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/jxpath/binaries/commons-jxpath-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-jxpath-${pkgver}/commons-jxpath-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jxpath/commons-jxpath.jar
}
md5sums=('3e8de5516bec9f30f6e43842acade11f')
