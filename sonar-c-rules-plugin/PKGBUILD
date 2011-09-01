# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>
pkgname=sonar-c-rules-plugin
pkgver=0.3
pkgrel=1
pkgdesc="Sonar C rules."
url="http://www.sonarsource.com/plugins/plugin-c/overview/"
arch=('any')
license=('LGPL3')
depends=('sonar-c-plugin')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-c-rules-plugin/0.3/${pkgname}-${pkgver}.jar")
noextract=(${pkgname}-${pkgver}.jar)
md5sums=('daf021d7347676ed1d4cb334e5d2a3bd')

package() {
  cd "${srcdir}"
  install -D -m644 "${pkgname}-${pkgver}.jar" "${pkgdir}/opt/sonar/extensions/plugins/${pkgname}-${pkgver}.jar"
}

# vim:set ts=2 sw=2 et:
