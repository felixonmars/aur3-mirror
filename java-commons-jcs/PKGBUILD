# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-jcs
pkgver=1.3
pkgrel=1
pkgdesc='Java Caching System.'
arch=(any)
url='http://commons.apache.org/jcs'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mir2.ovh.net/ftp.apache.org/dist//commons/jcs/binaries/jcs-${pkgver}.tar.gz")

package() {
  install -Dm644 ${srcdir}/jcs-${pkgver}/jcs-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jcs/commons-jcs.jar
}
md5sums=('525bcd92b7df824c45f29e5b703c940a')
