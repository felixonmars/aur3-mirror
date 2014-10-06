# Maintainer: float <flo.at at gmx dot de>

pkgname=keepass-traytotp
pkgver=2.0.0.5
pkgrel=2
pkgdesc="Plugin adding TOTP to KeePass2 tray menu, entry list and auto-type."
arch=('any')
url="https://sourceforge.net/projects/traytotp-kp2/"
license=('GPL3')
source=("http://downloads.sourceforge.net/project/traytotp-kp2/Tray%20TOTP%20v.%20${pkgver}/TrayTotp.plgx")
sha1sums=('96b8b8f48e76fc1afe05babbbbabac49ffae4e74')
depends=('keepass>=2.21')

package() {
  install -Dm644 TrayTotp.plgx "${pkgdir}/usr/share/keepass/plugins/TrayTotp.plgx"
}

# vim:set ts=2 sw=2 et:
