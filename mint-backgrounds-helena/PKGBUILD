# Maintainer: Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>
# Special thanks to the Linux Mint project; without them this would not exist.
pkgname=mint-backgrounds-helena
pkgver=1.0
pkgrel=1
pkgdesc="The desktop backgrounds made for Linux Mint 8 Helena"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-helena"
license=('GPL')
depends=()
optdepends=()
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=('d90961aa05953227ac715df69079344b')

build() {
  cd "$srcdir/${pkgname}"
  cp -R usr $pkgdir/
}
# vim:syntax=sh
