# Maintainer: nous@archlinux.us

pkgname=polkit-automount-upower-rules
pkgver=1.0
pkgrel=1
pkgdesc="Polkit rules for automounting removable media and activating suspend and hibernate in shutdown options"
url="https://sourceforge.net/projects/archopenrc"
license=('GPL')
arch=('any')
depends=('consolekit' 'polkit-consolekit' 'udisks2-nosystemd' 'upower-pm-utils')
source=('60-upower.rules' '65-automount.rules')

package() {
  mkdir -m 700 -p ${pkgdir}/etc/polkit-1/rules.d/
  install -D -m 644 ${srcdir}/${source[0]} ${pkgdir}/etc/polkit-1/rules.d/
  install -D -m 644 ${srcdir}/${source[1]} ${pkgdir}/etc/polkit-1/rules.d/
}

sha256sums=('805cadc921bce8b11f1f6e170428a7d30fc9377f143df1ff4b0efe0e625a96bf'
            'f3f8cb03c13a84cacbc8f1e4517253a009d96335eb648a1253676dac75466766')
