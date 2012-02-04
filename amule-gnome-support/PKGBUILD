# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=amule-gnome-support
pkgver=2.3.1
pkgrel=1
pkgdesc="eD2k links handling support for GNOME web browsers"
arch=('any')
url="http://www.amule.org"
license=('GPL')
depends=('amule' 'gconf')
install=${pkgname}.install
source=(http://ftp.de.debian.org/debian/pool/main/a/amule/amule_${pkgver}-1.debian.tar.gz)
md5sums=('aac24a245100468eea87b3e728c3c57a')

package() {
  cd debian/schemas

  install -d -m755 ${pkgdir}/usr/share/gconf/schemas
  install -m644 ${pkgname}.schemas ${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas
}

# vim:set ts=2 sw=2 et:
