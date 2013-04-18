# Maintainer: Daniele Paolella <dp@hostess-promoter.com>
# Contributor: Richard Wilson
pkgname=radeon-modeset-service
pkgver=2013.04.17
pkgrel=1
pkgdesc="Systemd service to enable Radeon modeset after booting"
arch=('any')
url="https://bugzilla.redhat.com/show_bug.cgi?id=845745#c102"
license=('GPL')
install=$pkgname.install
changelog=ChangeLog
source=(radeon-modeset.service)
md5sums=('8faaa0eca2c2b195ac106277a4cecc6d')

package() {
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -m 644 radeon-modeset.service "$pkgdir/usr/lib/systemd/system"
}

# vim:set ts=2 sw=2 et:
