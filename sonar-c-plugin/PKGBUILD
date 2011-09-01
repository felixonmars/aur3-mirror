# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=sonar-c-plugin
pkgver=1.3.1
pkgrel=1
pkgdesc="Sonar C plugin."
url="http://www.sonarsource.com/plugins/plugin-c/overview/"
arch=('any')
license=('custom')
depends=('sonar')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://dist.sonarsource.com/c/download/${pkgname}-${pkgver}.jar")
noextract=(${pkgname}-${pkgver}.jar)
md5sums=('ff97740510f7cb6cc0e90438b0650995')

package() {
  cd "${srcdir}"
  install -D -m644 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/sonar/extensions/plugins/${pkgname}-${pkgver}.jar"
}

# vim:set ts=2 sw=2 et:
