# Maintainer: Todd Partridge <http://https://github.com/Gen2ly/archpkgs>

pkgname=systemd-timer-pacman-optimize-git
_pkgname=${pkgname%-*}
pkgver=1.0.1
pkgrel=1
pkgdesc="Systemd timer to optimize the pacman database every month."
arch=("any")
url="https://github.com/Gen2ly/$_pkgname"
license=("GPL2")
depends=("systemd")
makedepends=("git")
install=
source=("git://github.com/Gen2ly/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

package() {
  cd $srcdir/$_pkgname
  _pkgdir=$pkgdir/usr/lib/systemd/system/
  install -Dm644 pacman-optimize.service $_pkgdir/pacman-optimize.service
  install -Dm644 pacman-optimize.timer   $_pkgdir/pacman-optimize.timer
  #install -d $_pkgdir/multi-user.target.wants
  #ln -s $_pkgdir/pacman-optimize.timer \
  #  $_pkgdir/multi-user.target.wants/pacman-optimize.timer
  install -Dm644 license.txt  $pkgdir/usr/share/licenses/$_pkgname/license.txt
}

# vim:set ts=2 sw=2 et: