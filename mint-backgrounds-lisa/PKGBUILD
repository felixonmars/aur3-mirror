# Special thanks to the Linux Mint project; without them this would not exist.
pkgname=mint-backgrounds-lisa
pkgver=1.1
pkgrel=1
pkgdesc="The desktop backgrounds made for Linux Mint 12 Lisa"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-backgrounds-lisa/"
license=('GPL')
depends=()
optdepends=()
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=('20f5b7e3835555335c8fd30c49faa489')

build() {
  cd "$srcdir/${pkgname}"
  cp -R usr $pkgdir/
}
# vim:syntax=sh
