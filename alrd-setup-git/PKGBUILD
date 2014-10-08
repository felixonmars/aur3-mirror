# Maintainer: Gently <toddrpartridge@gmail.com>

pkgname=alrd-setup-git
_pkgname=${pkgname%-*}
pkgver=0.89.4
pkgrel=1
pkgdesc="The Arch Linux Rescue Disk environment setup script."
arch=("any")
url="https://github.com/Gen2ly/$_pkgname"
license=("GPL2")
depends=("systemd")
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
  install -Dm755 alrd-doc      $pkgdir/usr/bin/alrd-doc
  install -Dm644 alrd-doc.md   $pkgdir/usr/share/doc/$_pkgname/alrd-doc.md
  install -Dm755 alrd-login.sh $pkgdir/etc/profile.d/alrd-login.sh
  install -Dm755 $_pkgname     $pkgdir/usr/bin/$_pkgname
  install -Dm644 license.txt   $pkgdir/usr/share/licenses/$_pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
