# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-scxml
pkgver=0.9
pkgrel=1
pkgdesc='Implementation of the State Chart XML specification.'
arch=(any)
url='http://commons.apache.org/scxml'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/scxml/binaries/commons-scxml-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-scxml-${pkgver}/commons-scxml-${pkgver}.jar ${pkgdir}/usr/share/java/commons-scxml/commons-scxml.jar
}
md5sums=('93c31860c28365080f8f429d533f5cbd')
