# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-jci
pkgver=1.0
pkgrel=1
pkgdesc='Java Compiler Interface.'
arch=(any)
url='http://commons.apache.org/jci'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/jci/binaries/commons-jci-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-jci-${pkgver}-bin/lib/commons-jci-core-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jci/commons-jci-core.jar
  install -Dm644 ${srcdir}/commons-jci-${pkgver}-bin/lib/commons-jci-eclipse-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jci/commons-jci-eclipse.jar
  install -Dm644 ${srcdir}/commons-jci-${pkgver}-bin/lib/commons-jci-examples-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jci/commons-jci-examples.jar
  install -Dm644 ${srcdir}/commons-jci-${pkgver}-bin/lib/commons-jci-fam-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jci/commons-jci-fam.jar
  install -Dm644 ${srcdir}/commons-jci-${pkgver}-bin/lib/commons-jci-groovy-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jci/commons-jci-groovy.jar
  install -Dm644 ${srcdir}/commons-jci-${pkgver}-bin/lib/commons-jci-janino-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jci/commons-jci-janino.jar
  install -Dm644 ${srcdir}/commons-jci-${pkgver}-bin/lib/commons-jci-javac-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jci/commons-jci-javac.jar
  install -Dm644 ${srcdir}/commons-jci-${pkgver}-bin/lib/commons-jci-rhino-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jci/commons-jci-rhino.jar
}
md5sums=('256550e0c926a5f1c2602e51ff39bd97')
