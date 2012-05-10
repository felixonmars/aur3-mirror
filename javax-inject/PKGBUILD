# Maintainer: Roy Lines <roy@roylines.co.uk>

pkgname=javax-inject
pkgver=1
pkgrel=1
pkgdesc="Final javax.inject API (from atinject project)"
arch=('any')
noextract=('${pkgname}-${pkgver}.jar')

url="http://code.google.com/p/dependency-shot/"
license=('BSD')

source=("javax.inject.jar::http://dependency-shot.googlecode.com/files/javax.inject.jar")
md5sums=('2355d135146211ca7f979802f39b2326')

package() {
  cd "${srcdir}"
  install -Dm644 javax.inject.jar "${pkgdir}/usr/share/java/javax.inject.jar"
}
