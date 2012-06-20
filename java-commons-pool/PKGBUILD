# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-pool
pkgver=1.6
pkgrel=1
pkgdesc='Generic object pooling component.'
arch=(any)
url='http://commons.apache.org/pool'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/pool/binaries/commons-pool-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-pool-${pkgver}/commons-pool-${pkgver}.jar ${pkgdir}/usr/share/java/commons-pool/commons-pool.jar
}
md5sums=('70a1573d13d76fa3bafe4ee163904e24')
