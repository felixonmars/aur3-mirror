# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-betwixt
pkgver=0.8
pkgrel=1
pkgdesc='Provides an XML introspection mechanism for mapping beans to XML in a flexible way.'
arch=(any)
url='http://commons.apache.org/betwixt'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirrors.ircam.fr/pub/apache//commons/betwixt/binaries/commons-betwixt-${pkgver}.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-betwixt-${pkgver}/commons-betwixt-${pkgver}.jar ${pkgdir}/usr/share/java/commons-betwixt/commons-betwixt.jar
}
md5sums=('4d87a842edf75407e9bae380fcc6bbab')
