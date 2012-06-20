# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-validator
pkgver=1.4.0
pkgrel=1
pkgdesc='Framework to define validators and validation rules in an xml file.'
arch=(any)
url='http://commons.apache.org/validator'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/validator/binaries/commons-validator-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-validator-${pkgver}/commons-validator-${pkgver}.jar ${pkgdir}/usr/share/java/commons-validator/commons-validator.jar
}
md5sums=('208137136d01c8d6e4859c43f36a75de')
