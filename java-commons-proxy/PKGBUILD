# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-proxy
pkgver=1.0
pkgrel=1
pkgdesc='Library for creating dynamic proxies.'
arch=(any)
url='http://commons.apache.org/proxy'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/proxy/binaries/commons-proxy-${pkgver}.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-proxy-${pkgver}/commons-proxy-${pkgver}.jar ${pkgdir}/usr/share/java/commons-proxy/commons-proxy.jar
}
md5sums=('0a0ff60ce58634de21082318de0ce8f6')
