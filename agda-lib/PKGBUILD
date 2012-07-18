pkgname=agda-lib
pkgver=0.6
pkgrel=1
pkgdesc="The Agda standard library"
url="http://wiki.portal.chalmers.se/agda/pmwiki.php"
license=("OtherLicense")
arch=('i686' 'x86_64')
makedepends=()
depends=()
source=("http://www.cse.chalmers.se/~nad/software/lib-${pkgver}.tar.gz")
sha256sums=('f3b22d104a1d91e558e833ff968cf63dbe239601e15d91e380ef791f75d82060')
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
