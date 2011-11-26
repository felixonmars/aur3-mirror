# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-primitives
pkgver=1.0
pkgrel=1
pkgdesc='Smaller, faster and easier to work with types supporting Java primitive types.'
arch=(any)
url='http://commons.apache.org/primitives'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/primitives/binaries/commons-primitives-${pkgver}.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-primitives-${pkgver}/commons-primitives-${pkgver}.jar ${pkgdir}/usr/share/java/commons-primitives/commons-primitives.jar
}
md5sums=('2ce92656204f2fa63dad6dfa88e1458b')
