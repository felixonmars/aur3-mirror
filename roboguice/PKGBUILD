# Maintainer: Roy Lines <roy@roylines.co.uk>

pkgname=roboguice
pkgver=2.0
pkgrel=3
pkgdesc="Google Guice on android"
arch=('any')
noextract=('${pkgname}-${pkgver}.jar')
depends=('guice-3.0-no_aop' 'javax-inject')
optdepends=('jsr305: support for @Nullable annotation')

url="http://code.google.com/p/roboguice/"
license=('Apache')

source=("${pkgname}-${pkgver}.jar::http://repo1.maven.org/maven2/org/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.jar")
md5sums=('ed552c9f9cbef2918cc57a6c10e4888b')

package() {
  cd "${srcdir}"
  install -Dm644 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}-${pkgver}.jar"
}
