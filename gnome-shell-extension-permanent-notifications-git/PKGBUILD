# Maintainer: jtts
# Contributor: Christian METZLER <neroth@xeked.com>

pkgname=gnome-shell-extension-permanent-notifications-git
pkgver=20140501
pkgrel=1
pkgdesc="A Gnome Shell extension to show the notifications as long as you don't take any action on them."
arch=('any')
url="https://github.com/bonzini/gnome-shell-permanent-notifications"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
#replaces=('')
install='gnome-shell-extension.install'
source=("$pkgname"::"git+https://github.com/bonzini/gnome-shell-permanent-notifications")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 README.md $pkgdir/usr/share/gnome-shell/extensions/permanent-notifications@bonzini.gnu.org/README.md
  install -Dm644 permanent-notifications@bonzini.gnu.org/extension.js $pkgdir/usr/share/gnome-shell/extensions/permanent-notifications@bonzini.gnu.org/extension.js
  install -Dm644 permanent-notifications@bonzini.gnu.org/metadata.json $pkgdir/usr/share/gnome-shell/extensions/permanent-notifications@bonzini.gnu.org/metadata.json
}
