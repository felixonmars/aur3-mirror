# Maintainer: Carl George < carl at carlgeorge dot us >
# Contributor:  Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>
# Special thanks to the Linux Mint project, without them this would not exist.

pkgname=mint-elementary-icons
pkgver=1.0.0
pkgrel=1
pkgdesc="mint elementary icon theme"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-elementary-icons"
license=('GPL')
depends=()
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=('5ca7db3b3451db71dfed97521dcf1b99')

build() {
 cd "$srcdir/${pkgname}"
 cp -R usr $pkgdir/
}

# vim:syntax=sh
