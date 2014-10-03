pkgname=agda-lib
pkgver=0.8.1
pkgrel=1
pkgdesc="The Agda standard library"
url="http://wiki.portal.chalmers.se/agda/pmwiki.php?n=Libraries.StandardLibrary"
license=("OtherLicense")
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=()
source=("https://github.com/agda/agda-stdlib/archive/v${pkgver}.tar.gz")
sha256sums=('ee11ba4579f2b6b590660d469885636d086beb7a0589676300f88249c9cb4446')
install="${pkgname}.install"

build() {
  cd ${srcdir}/agda-stdlib-${pkgver}

  msg "Generating Everything.agda"
  ghc -o GenerateEverything GenerateEverything.hs
  ./GenerateEverything
  cp Everything.agda src/

  msg "Compiling .agda  to .agdai"
  cd src/
  command -v agda >/dev/null 2>&1 || { error >&2 "Could not find agda executable."; exit 1; }
  agda Everything.agda
  rm Everything.agda
}

package() {
  cd ${srcdir}/agda-stdlib-${pkgver}/src
  install -d ${pkgdir}/usr/lib/agda
  cp -r * ${pkgdir}/usr/lib/agda
}
