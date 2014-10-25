# Maintainer: Todd Partridge <http://https://github.com/Gen2ly/archpkgs>

pkgname=alrd-buildimg-git
_pkgname=${pkgname%-*}
pkgver=0.92.6
pkgrel=2
pkgdesc="A script that builds the Arch Linux Rescue Disk ISO images."
arch=("any")
url="https://github.com/Gen2ly/$_pkgname"
license=("GPL2")
depends=("pkgcacheclean" "trizen" "squashfs-tools" "systemd")
makedepends=("git")
conflicts=("")
install=
source=("git://github.com/Gen2ly/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 $_pkgname      $pkgdir/usr/bin/$_pkgname
  install -Dm644 $_pkgname.conf $pkgdir/etc/$_pkgname/$_pkgname.conf
  install -Dm644 pacman.conf    $pkgdir/etc/$_pkgname/pacman.conf
  install -Dm644 license.txt    $pkgdir/usr/share/licenses/$_pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
