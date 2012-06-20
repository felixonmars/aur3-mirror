# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-jexl
pkgver=2.1.1
pkgrel=1
pkgdesc='Expression language which extends the Expression Language of the JSTL.'
arch=(any)
url='http://commons.apache.org/jexl'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/jexl/binaries/commons-jexl-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-jexl-${pkgver}/commons-jexl-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jexl/commons-jexl.jar
}
md5sums=('191c39588d6d14f4cdf6ce30ab9e9629')
