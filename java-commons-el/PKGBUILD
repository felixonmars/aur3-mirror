# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-el
pkgver=1.0
pkgrel=1
pkgdesc='Interpreter for the Expression Language defined by the JSP 2.0 specification.'
arch=(any)
url='http://commons.apache.org/el'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/el/binaries/commons-el-${pkgver}.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-el-${pkgver}/commons-el.jar ${pkgdir}/usr/share/java/commons-el/commons-el.jar
}
md5sums=('fb856b9689bdc4c52f8ae999057f89fc')
