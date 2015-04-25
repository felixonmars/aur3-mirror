# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=tpacpi-bat
pkgver=2.2
pkgrel=1
pkgdesc="A Perl script with ACPI calls for recent ThinkPads (such as T420 and W520) whose battery thresholds are not supported by tp_smapi"
url="https://github.com/teleshoes/tpacpi-bat"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('perl' 'acpi_call')
conflicts=('tpacpi-bat-git')
source=(https://github.com/teleshoes/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('299c8a8745d55bb7ff0b23d40547d2f6cfba64c73c94d739174a6aeda807de70')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname%-*}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
}
