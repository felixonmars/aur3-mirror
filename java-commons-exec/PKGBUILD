# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-exec
pkgver=1.1
pkgrel=1
pkgdesc='API for dealing with external process execution and environment management.'
arch=(any)
url='http://commons.apache.org/exec'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/exec/binaries/commons-exec-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-exec-${pkgver}/commons-exec-${pkgver}.jar ${pkgdir}/usr/share/java/commons-exec/commons-exec.jar
}
md5sums=('e72ce14f3e39248251b9501f429ce872')
