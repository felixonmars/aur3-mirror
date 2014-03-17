# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-compress
pkgver=1.8
pkgrel=1
pkgdesc='Java API for working with tar, zip and bzip2 files.'
arch=(any)
url='http://commons.apache.org/compress/'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirror.ibcp.fr/pub/apache/commons/compress/binaries/commons-compress-${pkgver}-bin.tar.gz")

package() {
  install -Dm644 ${srcdir}/commons-compress-${pkgver}/commons-compress-${pkgver}.jar ${pkgdir}/usr/share/java/commons-compress/commons-compress.jar
}
md5sums=('e4602473aa2b69718a3fc64fd706eb57')
