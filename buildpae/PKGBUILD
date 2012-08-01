# Contributor: Tom Wizetek <tom@wizetek.com>
pkgname=buildpae
pkgver=3.4.6
pkgrel=1
pkgdesc="BASH script which builds linux-pae and linux-pae-headers packages by modifying stock kernel files from ABS."
arch=('any')
license=('GPL')
url="http://www.wizetek.com"
source=(${pkgname})
md5sums=('372c21e3303f52b6e45a3907cf251c47')

package() {
  install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
