# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-discovery
pkgver=0.5
pkgrel=1
pkgdesc='Tools for locating resources by mapping service/reference names to resource names.'
arch=(any)
url='http://commons.apache.org/discovery'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/discovery/binaries/commons-discovery-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-discovery-${pkgver}/commons-discovery-${pkgver}.jar ${pkgdir}/usr/share/java/commons-discovery/commons-discovery.jar
}
md5sums=('aa138c97054aadd3e7aed34d99d9dd3a')
