# Maintainer: Gently <toddrpartridge@gmail.com>

pkgname=mkinitcpio-unsquashtmpfs-git
_pkgname=${pkgname%-*}
_othname=unsquashtmpfs
pkgver=0.87.1
pkgrel=1
pkgdesc="mkinitcpio hook that decompresses a squashfs image and mounts it to tmpfs."
arch=("any")
url="https://github.com/Gen2ly/$_pkgname"
license=("GPL2")
depends=("")
makedepends=("git")
replaces="$_pkgname"
install=
source=("git://github.com/Gen2ly/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}

package() {
  cd $srcdir/$_pkgname
  install -Dm644 hook        $pkgdir/usr/lib/initcpio/hooks/$_othname
  install -Dm644 install     $pkgdir/usr/lib/initcpio/install/$_othname
  install -Dm644 license.txt $pkgdir/usr/share/licenses/$_pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
