# Contributor: Tomas Kramar <kramar.tomas@gmail.com>
pkgname=pm-bust
pkgver=1
pkgrel=1
pkgdesc="Disallows hibernation after kernel upgrade"
arch=('any')
url="http://github.com/kremso/pm-bust"
license=('MIT')
groups=()
depends=()
optdepends=('zenity: gui notifications'
'xdialog: gui notifications')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=pm.install
source=('pm-bust')
noextract=()
md5sums=('0344097832bebe043d60980ae5b0fbc3')

build() {
  mkdir -p $pkgdir/usr/sbin || return 1
  mv pm-bust $pkgdir/usr/sbin || return 1
}
