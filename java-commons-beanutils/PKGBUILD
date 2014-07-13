# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-beanutils
pkgver=1.9.2
pkgrel=1
pkgdesc='Easy-to-use wrappers around reflection and introspection APIs.'
arch=(any)
url='http://commons.apache.org/beanutils'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/beanutils/binaries/commons-beanutils-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-beanutils-${pkgver}/commons-beanutils-${pkgver}.jar              ${pkgdir}/usr/share/java/commons-beanutils/commons-beanutils.jar
  install -Dm644 ${srcdir}/commons-beanutils-${pkgver}/commons-beanutils-${pkgver}-javadoc.jar      ${pkgdir}/usr/share/java/commons-beanutils/commons-beanutils-javadoc.jar
  install -Dm644 ${srcdir}/commons-beanutils-${pkgver}/commons-beanutils-${pkgver}-sources.jar      ${pkgdir}/usr/share/java/commons-beanutils/commons-beanutils-sources.jar
  install -Dm644 ${srcdir}/commons-beanutils-${pkgver}/commons-beanutils-${pkgver}-tests.jar        ${pkgdir}/usr/share/java/commons-beanutils/commons-beanutils-tests.jar
  install -Dm644 ${srcdir}/commons-beanutils-${pkgver}/commons-beanutils-${pkgver}-test-sources.jar ${pkgdir}/usr/share/java/commons-beanutils/commons-beanutils-test-sources.jar
}
md5sums=('e9a8386afd60825246743121ac294658')
