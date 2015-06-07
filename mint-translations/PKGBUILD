# Maintainer: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>
# Special thanks to the Linux Mint project; without them this would not exist.
pkgname=mint-translations
pkgver=2015.06.02
pkgrel=1
pkgdesc="Linux Mint Translation Files"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-translations"
license=('GPL3')
depends=()
optdepends=()
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=('f11589ec1b4cb1c18bdb0dd409fe7a16')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make buildmo
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cp -R usr $pkgdir/
}
# vim:syntax=sh
