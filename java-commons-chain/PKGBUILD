# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-chain
pkgver=1.2
pkgrel=1
pkgdesc='Chain of Responsibility pattern implementation.'
arch=(any)
url='http://commons.apache.org/chain'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/chain/binaries/commons-chain-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-chain-${pkgver}/commons-chain-${pkgver}.jar ${pkgdir}/usr/share/java/commons-chain/commons-chain.jar
}
md5sums=('42d6a4fd3316f88a01eeb0e0c0f89e0f')
