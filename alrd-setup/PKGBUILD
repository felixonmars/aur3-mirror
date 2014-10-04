# Maintainer: Gently <toddrpartridge@gmail.com>

pkgname=alrd-setup
pkgver=0.89
pkgrel=1
pkgdesc="The Arch Linux Rescue Disk environment setup script."
arch=("any")
url="https://github.com/Gen2ly/alrd-setup"
license=("GPL2")
depends=("systemd")
makedepends=("git")
conflicts=("")
install=
changelog=
source=("git://github.com/Gen2ly/alrd-setup")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$pkgname
  git describe | sed 's/^v//;s/-.*//'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 alrd-doc      "$pkgdir"/usr/bin/alrd-doc
  install -Dm644 alrd-doc.md   "$pkgdir"/usr/share/doc/alrd-setup/alrd-doc.md
  install -Dm755 alrd-login.sh "$pkgdir"/etc/profile.d/alrd-login.sh
  install -Dm755 alrd-setup    "$pkgdir"/usr/bin/alrd-setup
  install -Dm644 license.txt   "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
