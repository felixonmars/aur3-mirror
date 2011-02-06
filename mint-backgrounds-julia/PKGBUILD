# Maintainer: Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>
# Special thanks to the Linux Mint project; without them this would not exist.
pkgname=mint-backgrounds-julia
pkgver=1.0
pkgrel=1
pkgdesc="The desktop backgrounds made for Linux Mint 10 Julia"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-julia"
license=('GPL')
depends=()
optdepends=()
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=('88f4ce5f8e2b1802b477faffc26393a4')

build() {
  cd "$srcdir/${pkgname}"
  cp -R usr $pkgdir/
}
# vim:syntax=sh
