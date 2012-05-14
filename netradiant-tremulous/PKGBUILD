# Maintainer: Viech

pkgname="netradiant-tremulous"
pkgver=20110214
pkgrel=1
pkgdesc="Netradiant support files for your Tremulous installation"
arch=("any")
url="http://ingar.satgnu.net/gtkradiant/index.html"
license=("unknown")
depends=("tremulous-data" "netradiant")

source=("http://ingar.satgnu.net/gtkradiant/files/${pkgname}-support.zip")
md5sums=('eaaf4e3ff79d9dd3b6086010497580f4')

package() {
  mkdir -p ${pkgdir}/opt/tremulous/base
  cp -r ${srcdir}/*.pk3 ${srcdir}/scripts ${pkgdir}/opt/tremulous/base
}
