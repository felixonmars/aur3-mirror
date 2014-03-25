# Maintainer: Artem Grunichev <gluk@umbrosia.ru>
pkgname=spf-64
pkgver=4.20
pkgrel=1
epoch=
pkgdesc="SP-Forth is an ANS forth system for Windows and Linux, 64-bit version."
arch=('x86_64')
url=("https://github.com/VoidVolker/spf64")
license=('GPL')
groups=()
depends=()
makedepends=('git')
optdepends=()
conflicts=(spf)
replaces=()
source=()
md5sums=()

build() {
  cd "${srcdir}"
  git clone git://github.com/VoidVolker/spf64 ${pkgname}-${pkgver}
  cd "${srcdir}/${pkgname}-${pkgver}/spf64"
  chmod +x spf/bbuild.sh
  chmod +x spf/spforig
  make
}

package() {
  mkdir -p "${pkgdir}"/usr/bin
  cd "${srcdir}/${pkgname}-${pkgver}/spf64"
  cp spf64 "${pkgdir}"/usr/bin/spf
}

# vim:set ts=2 sw=2 et:
