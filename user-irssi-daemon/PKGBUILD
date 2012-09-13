# Maintainer: Guten Ye

pkgname="user-irssi-daemon"
pkgver=0.1
pkgrel=3
pkgdesc="an irssi user daemon"
arch=("any")
url="http://www.irssi.org"
license=("MIT")
depends=("user-daemon-system-git" "screen" "irssi")
source=("rc.irssi")

package() {
  cd "$srcdir"

  install -Dm755 rc.irssi "$pkgdir/home/$USER/etc/rc.d/irssi"
  chown $USER:$USER -R "$pkgdir/home/$USER"
}

# vim:set ts=2 sw=2 et:
md5sums=('edcbf44b1f5d4dc4429d085505d1d691')
