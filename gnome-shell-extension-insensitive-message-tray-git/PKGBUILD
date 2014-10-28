# Maintainer: Todd Partridge <http://https://github.com/Gen2ly/archpkgs>

pkgname=gnome-shell-extension-insensitive-message-tray-git
_pkgname=insensitive-message-tray
pkgver=25
pkgrel=1
pkgdesc="GNOME shell extension to disable bottom-screen, mouse-gesture to show message tray."
arch=("any")
url="https://github.com/tuxor1337/"$_pkgname"/"
license=("GPL2")
depends=("gnome-shell")
makedepends=("git")
conflicts=("")
install=
source=("git://github.com/tuxor1337/"$_pkgname""
        license.txt)
md5sums=('SKIP'
         b234ee4d69f5fce4486a80fdaf4a4263)

pkgver() {
  cd $srcdir/$_pkgname
  git rev-list --count HEAD
}

package() {
  cd $srcdir/$_pkgname
  gsedir="$pkgdir"/usr/share/gnome-shell/extensions/insensitivetray@tovotu.de
  install -Dm644 extension.js  "$gsedir"/extension.js
  install -Dm644 metadata.json "$gsedir"/metadata.json
  cd $startdir
  install -Dm644 license.txt   "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

# vim:set ts=2 sw=2 et:
