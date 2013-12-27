# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-fileupload
pkgver=1.3
pkgrel=1
pkgdesc='File upload capability for your servlets and web applications.'
arch=(any)
url='http://commons.apache.org/fileupload'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/fileupload/binaries/commons-fileupload-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-fileupload-${pkgver}/lib/commons-fileupload-${pkgver}.jar ${pkgdir}/usr/share/java/commons-fileupload/commons-fileupload.jar
}
md5sums=('d354abbcf2de72525aded71fc5f3b354')
