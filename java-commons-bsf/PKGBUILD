# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-bsf
pkgver=3.1
pkgrel=1
pkgdesc='Bean Scripting Framework'
arch=(any)
url='http://commons.apache.org/bsf'
license=(APACHE)
depends=('java-runtime>=5')
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache//commons/bsf/binaries/bsf-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/bsf-${pkgver}/lib/bsf-all-${pkgver}.jar ${pkgdir}/usr/share/java/commons-bsf/bsf-all.jar
  install -Dm644 ${srcdir}/bsf-${pkgver}/lib/bsf-api-${pkgver}.jar ${pkgdir}/usr/share/java/commons-bsf/bsf-api.jar
  install -Dm644 ${srcdir}/bsf-${pkgver}/lib/bsf-utils-${pkgver}.jar ${pkgdir}/usr/share/java/commons-bsf/bsf-utils.jar
}
md5sums=('61aff97db5ac13cc1c2d16876fbb6119')
