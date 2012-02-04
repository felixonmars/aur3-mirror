# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-bcel
pkgver=5.2
pkgrel=1
pkgdesc='Java Byte Code Engineering Library, giving users a convenient way to analyze, create, and manipulate (binary) Java class files.'
arch=(any)
url='http://commons.apache.org/bcel'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://mirrors.ircam.fr/pub/apache/commons/bcel/binaries/bcel-${pkgver}.tar.gz")

package() {
  install -Dm644 ${srcdir}/bcel-${pkgver}/bcel-${pkgver}.jar ${pkgdir}/usr/share/java/commons-bcel/commons-bcel.jar
}
md5sums=('19bffd7f217b0eae415f1ef87af2f0bc')
