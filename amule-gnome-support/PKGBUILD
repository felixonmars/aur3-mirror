# Maintainer: Alessio Sergi <asergi [at] archlinux [dot] us>

pkgname=amule-gnome-support
pkgver=2.2.6
pkgrel=3
pkgdesc="eD2k links handling support for GNOME web browsers"
arch=('any')
url="http://www.amule.org"
license=('GPL')
depends=('amule' 'gconf')
install=${pkgname}.install
source=(${pkgname}.schemas)
md5sums=('a0178f3a302a706d8dc49b4fc053e65e')

package() {
  install -d -m755 ${pkgdir}/usr/share/gconf/schemas
  install -m644 ${srcdir}/${pkgname}.schemas ${pkgdir}/usr/share/gconf/schemas/
}
