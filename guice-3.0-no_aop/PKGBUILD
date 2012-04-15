# Maintainer: Roy Lines <roy@roylines.co.uk>

pkgname=guice-3.0-no_aop
pkgver=3.0
pkgrel=2
pkgdesc="a lightweight dependency injection framework for Java, without AOP, suitable for Android"
arch=('any')
noextract=('${pkgname}.jar')

url="http://code.google.com/p/google-guice/"
license=('Apache')

source=("${pkgname}.jar::http://google-guice.googlecode.com/files/${pkgname}.jar")
md5sums=('aa91894a74392a9f50be44ca185baa12')

package() {
  cd "${srcdir}"
  install -Dm644 ${pkgname}.jar "${pkgdir}/usr/share/java/${pkgname}.jar"
}
