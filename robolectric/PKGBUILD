# Maintainer: Roy Lines <roy@roylines.co.uk>

pkgname=robolectric
pkgver=1.2
pkgrel=3
pkgdesc="A unit test framework that de-fangs the Android SDK jar so you can test-drive the development of your Android app."
arch=('any')
noextract=('${pkgname}-${pkgver}.jar')

url="http://pivotal.github.com/robolectric/"
license=('MIT')

source=("${pkgname}-${pkgver}.jar::https://oss.sonatype.org/service/local/repositories/releases/content/com/pivotallabs/${pkgname}/${pkgver}/robolectric-${pkgver}.jar")
md5sums=('4e53a2e804d11d01ad9017988ce6fa62')

package() {
  cd "${srcdir}"
  install -Dm644 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}-${pkgver}.jar"
}
