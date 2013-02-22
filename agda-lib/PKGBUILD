pkgname=agda-lib
pkgver=0.7
pkgrel=1
pkgdesc="The Agda standard library"
url="http://wiki.portal.chalmers.se/agda/pmwiki.php"
license=("OtherLicense")
arch=('i686' 'x86_64')
makedepends=()
depends=()
source=("http://www.cse.chalmers.se/~nad/software/lib-${pkgver}.tar.gz")
sha256sums=('631a33e8e27ead32c85cc92a0a85849744d3b2960ef9675736d54288267ed2fa')
install="${pkgname}.install"

build() {
  cd ${srcdir}/lib-${pkgver}/src
  cp ../Everything.agda .
  command -v agda >/dev/null 2>&1 || { error >&2 "Could not find agda executable."; exit 1; }
  msg "Compiling .agda  to .agdai"
  agda Everything.agda
  rm Everything.agda
}

package() {
  cd ${srcdir}/lib-${pkgver}/src
  install -d ${pkgdir}/usr/lib/agda
  cp -r * ${pkgdir}/usr/lib/agda
}
