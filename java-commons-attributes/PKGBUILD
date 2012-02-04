# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-attributes
pkgver=2.2
pkgrel=1
pkgdesc='Enables Java programmers to use .Net-style attributes in their code.'
arch=(any)
url='http://commons.apache.org/attributes'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mir2.ovh.net/ftp.apache.org/dist//commons/attributes/binaries/commons-attributes-${pkgver}.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-attributes-${pkgver}/commons-attributes-api-${pkgver}.jar ${pkgdir}/usr/share/java/commons-attributes/commons-attributes-api.jar
  install -Dm644 ${srcdir}/commons-attributes-${pkgver}/commons-attributes-compiler-${pkgver}.jar ${pkgdir}/usr/share/java/commons-attributes/commons-attributes-compiler.jar
  install -Dm644 ${srcdir}/commons-attributes-${pkgver}/commons-attributes-plugin-${pkgver}.jar ${pkgdir}/usr/share/java/commons-attributes/commons-attributes-plugin.jar
}
md5sums=('47d037449aa38b6c8e181abcfaf36b2b')
