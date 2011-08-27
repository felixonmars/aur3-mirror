# Maintainer: Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>
# Special thanks to the Linux Mint project; without them this tool would not exist.
pkgname=mint-common
pkgver=1.0.5
pkgrel=1
pkgdesc="Linux Mint Common Files"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-common"
license=('GPL')
depends=('python' 'gnome-python-desktop' 'pygtk' 'mint-translations')
optdepends=()
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=('c9876054e3c9d4dd224ee1a605fc8b7b')

build() {
  cd "$srcdir/${pkgname}"
  cp -R usr $pkgdir/
}
# vim:syntax=sh
