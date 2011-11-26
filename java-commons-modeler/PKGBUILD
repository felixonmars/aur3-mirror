# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-modeler
pkgver=2.0.1
pkgrel=1
pkgdesc='Mechanisms to create Model MBeans compatible with JMX specification.'
arch=(any)
url='http://commons.apache.org/modeler'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://apache.multidist.com//commons/modeler/binaries/commons-modeler-${pkgver}.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-modeler-${pkgver}/commons-modeler-${pkgver}.jar ${pkgdir}/usr/share/java/commons-modeler/commons-modeler.jar
}
md5sums=('f2b611f25bfbb2ed9a1a145653d9d023')
