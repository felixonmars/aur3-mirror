# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-digester
pkgver=3.2
pkgrel=1
pkgdesc='XML-to-Java-object mapping utility.'
arch=(any)
url='http://commons.apache.org/digester'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache//commons/digester/binaries/commons-digester3-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-digester3-${pkgver}/commons-digester3-${pkgver}.jar ${pkgdir}/usr/share/java/commons-digester/commons-digester.jar
}
md5sums=('b67dba335877e5470b1220fadd3501ad')
