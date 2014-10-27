# Maintainer: Todd Partridge <http://https://github.com/Gen2ly/archpkgs>

pkgname=gnome-shell-extension-nohotcorner-git
_pkgname=nohotcorner
pkgver=36
pkgrel=1
pkgdesc="GNOME shell extension to disable hotcorner menu opening."
arch=("any")
url="https://github.com/HROMANO/"$_pkgname"/"
license=("GPL2")
depends=("gnome-shell")
makedepends=("git")
conflicts=("")
install=
source=("git://github.com/HROMANO/"$_pkgname"")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git rev-list --count HEAD
}

package() {
  cd $srcdir/$_pkgname
  gsedir="$pkgdir"/usr/share/gnome-shell/extensions/"$_pkgname"@azuri.free.fr
  install -Dm644 extension.js  "$gsedir"/extension.js
  install -Dm644 metadata.json "$gsedir"/metadata.json
  install -Dm644 LICENSE       "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

# vim:set ts=2 sw=2 et: