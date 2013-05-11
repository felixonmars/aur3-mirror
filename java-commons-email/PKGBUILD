# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-email
pkgver=1.3.1
pkgrel=1
pkgdesc='Library for sending e-mail from Java.'
arch=(any)
url='http://commons.apache.org/email'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/email/binaries/commons-email-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-email-${pkgver}/commons-email-${pkgver}.jar ${pkgdir}/usr/share/java/commons-email/commons-email.jar
}
md5sums=('99aa6782f2ed93207fdc11b8e468543d')
