# Maintainer: Marty Plummer "The_NetZ" <ntzrmtthihu777 (at) gmail (dot) com>
pkgname=lwjgl-source
pkgver=2.9.1
pkgrel=1
pkgdesc='Lightweight Java Game Library source package - for use in IDEs.'
arch=(any)
url='http://lwjgl.org/'
license=('BSD')
options=(!strip)
source=(http://downloads.sourceforge.net/java-game-lib/${pkgname}-${pkgver}.zip)
md5sums=('6f09b268db93876c31dfbf5fa8a5e6e5')
sha1sums=('96d33deae951b294e9b9d651d91d391c46d7ef9b')
build() {
  cd ${srcdir}/src/java
  jar cvf ${pkgname}-${pkgver}.jar .
}
package() {
  mkdir -p "${pkgdir}/usr/share/lwjgl/source"
  install -m644 "${srcdir}/src/java/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/lwjgl/source/${pkgname}-${pkgver}.jar"
}
