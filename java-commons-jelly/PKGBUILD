# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=java-commons-jelly
pkgver=1.0
pkgrel=1
pkgdesc='XML based scripting and processing engine.'
arch=(any)
url='http://commons.apache.org/jelly'
license=(APACHE)
depends=(java-runtime)
changelog=Changelog
source=("http://www.apache.org/dist/java-repository/commons-jelly/jars/commons-jelly-${pkgver}.jar")

package() {
  install -Dm644 ${srcdir}/commons-jelly-${pkgver}.jar ${pkgdir}/usr/share/java/commons-jelly/commons-jelly.jar
}
md5sums=('344498b613049e41f16f064073f967b8')
