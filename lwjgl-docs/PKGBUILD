# Maintainer: Marty Plummer (The_NetZ) <ntzrmtthihu777 (at) gmail (dot) com>
pkgname=lwjgl-docs
pkgver=2.9.1
pkgrel=1
pkgdesc='Documentation for Lightweight Java Game Library - for use in IDEs.'
arch=(any)
url='http://lwjgl.org/'
license=('BSD')
options=(!strip)
source=(http://downloads.sourceforge.net/java-game-lib/$pkgname-$pkgver.zip)
md5sums=('ac67d3337c4cd845f7ef3e22550e2df9')
sha1sums=('5eaa94241560d5419b19ebdb4fb414c32bf560ef')

build() {
  # Create javadoc jar
  cd ${srcdir}/javadoc
  jar cvf lwjgl-javadoc-${pkgver}.jar .
}

package() {
  mkdir -p "${pkgdir}/usr/share/lwjgl/javadoc"
  install -m644 "${srcdir}/javadoc/lwjgl-javadoc-${pkgver}.jar" "${pkgdir}/usr/share/lwjgl/javadoc/lwjgl-javadoc-${pkgver}.jar"
}
