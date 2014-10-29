pkgname=salsa
pkgver=1.1.5
pkgrel=1
pkgdesc="Compiler and classes for the Salsa programming language"
url="http://wcl.cs.rpi.edu/salsa/"
arch=('any')
license=('unknown')
depends=('java-environment')
optdepends=()
makedepends=('java-environment')
conflicts=()
replaces=()
backup=()
source=("http://wcl.cs.rpi.edu/salsa/releases/salsa1.1.5_src.zip"
        "salsac"
        "salsa_")
md5sums=("6a760e8eace09e47be0146b80baa3691"
         "723f5ea4f77ca8f70b3e892b85c12f2d"
         "8019d025bcf9f69ec5b7815038199bf3")

build() {
  cd "${srcdir}/${pkgname}"
  CLASSPATH=. ./build.sh
}

package() {
  mkdir -p "${pkgdir}/usr/share/java/salsa"
  mkdir -p "${pkgdir}/usr/bin/"

  cd "${srcdir}/${pkgname}"
  install -Dm644 ${pkgname}${pkgver}.jar "${pkgdir}/usr/share/java/salsa/"
  cd ..
  install -Dm755 salsac "${pkgdir}/usr/bin/"
  install -Dm755 salsa_ "${pkgdir}/usr/bin/salsa"
}
# vim:set ts=2 sw=2 et:
