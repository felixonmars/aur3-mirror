# Maintainer: Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>
# Special thanks to the Linux Mint project; without them this would not exist.
pkgname=mint-backgrounds-isadora
pkgver=1.0
pkgrel=1
pkgdesc="The desktop backgrounds made for Linux Mint 9 Isadora"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-isadora"
license=('GPL')
depends=()
optdepends=()
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=('e71241cd869a5ad80d8277a336c5df88')

build() {
  cd "$srcdir/${pkgname}"
  cp -R usr $pkgdir/
}
# vim:syntax=sh
