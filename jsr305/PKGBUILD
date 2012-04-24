# Maintainer: Roy Lines <roy@roylines.co.uk>

pkgname=jsr305
pkgver=1.3.9
pkgrel=1
pkgdesc="Annotations for Software Defect Detection in Java"
arch=('any')
noextract=('${pkgname}-${pkgver}.jar')

url="http://code.google.com/p/jsr-305/"
license=('BSD')

source=("${pkgname}-${pkgver}.jar::http://repo1.maven.org/maven2/com/google/code/findbugs/${pkgname}/${pkgver}/${pkgname}-${pkgver}.jar")
md5sums=('1d5a772e400b04bb67a7ef4a0e0996d8')

package() {
  cd "${srcdir}"
  install -Dm644 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}-${pkgver}.jar"
}
