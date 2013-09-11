# Maintainer: DonVla <donvla@users.sourceforge.net>

pkgname=rpcalc
pkgver=0.6.0
pkgrel=2
pkgdesc="A simple reverse polish notation calculator"
arch=("i686" "x86_64")
url="http://rpcalc.bellz.org"
license=('GPL')
depends=("python2-pyqt")
source=("http://download.berlios.de/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('26573ca7369abc6228802b4a3eba3c56')
sha256sums=('7ecaea19a0aa6ce799c2abb0bb7f9185d043ab2a854eefa48b3f6e7853fedb3a')

package() {
  cd "${srcdir}/rpCalc"
  python2 install.py -p /usr -b "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
