# Maintainer: Alexey D. <lq07829icatm at rambler.ru>

pkgname=sysctl-default-conf
pkgver=0.1
pkgrel=1
pkgdesc="Some useful tweaks for kernel parameters (for systems without Systemd)"
arch=('any')
url="http://sourceforge.net/projects/procps-ng/"
license=('GPL2')
depends=('procps-ng')
backup=('etc/sysctl.conf')
options=('!strip' '!zipman')
install=sysctl-default-conf.install
source=('sysctl.conf')
md5sums=('6ca4801ce5efbd78804868339c14e95b')

package() {
  install -Dm644 "sysctl.conf" "$pkgdir/etc/sysctl.conf"
}

# vim:set ts=2 sw=2 et:
