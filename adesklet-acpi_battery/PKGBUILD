# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=adesklet-acpi_battery
pkgver=0.0.4
pkgrel=2
pkgdesc="Simple adesklet to monitor the battery level via the acpi interface"
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL')
depends=('adesklets')
groups=('adesklet-desklets')
backup=('usr/share/adesklets/acpi_battery/config.txt')
source=(http://downloads.sourceforge.net/adesklets/acpi_battery-$pkgver.tar.bz2)
md5sums=('86589cc6871649115629909f363bd623')

package() {
  cd ${srcdir}/acpi_battery-$pkgver/

#Python2 fix
  sed -i 's_env python_env python2_' acpi_battery.py

  install -d ${pkgdir}/usr/share/adesklets/acpi_battery/
  install -m664 -g adesklets COPYING GNUmakefile README battery.png cord.png \
    ${pkgdir}/usr/share/adesklets/acpi_battery/
  install -m775 -g adesklets acpi_battery.py ${pkgdir}/usr/share/adesklets/acpi_battery/
}
