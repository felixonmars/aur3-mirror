# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-transaction
pkgver=1.2
pkgrel=1
pkgdesc='Implementations for multi level locks, transactional collections and transactional file access.'
arch=(any)
url='http://commons.apache.org/transaction'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/transaction/binaries/commons-transaction-${pkgver}.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-transaction-${pkgver}/commons-transaction-${pkgver}.jar ${pkgdir}/usr/share/java/commons-transaction/commons-transaction.jar
}
md5sums=('c4f9ddec9a575249066c6948ffafe368')
