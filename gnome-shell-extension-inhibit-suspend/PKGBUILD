# Submitter: Gen2ly <toddrpartridge@gmail.com>

pkgname=gnome-shell-extension-inhibit-suspend
pkgver=3.60
_pkgver=f4e1f0f90c
pkgrel=1
pkgdesc="Adds a switch to the User Menu that gives you the ability to inhibit auto-suspend or screensaver from activating"
arch=(any)
url="https://extensions.gnome.org/extension/241/yet-another-inhibit-suspend-extension-user-menu/"
license=('GPL3')
depends=('gnome-shell')
conflicts=('gnome-shell-extension-inhibit-suspend-git')
#install=gschemas.install
source=(https://github.com/lavi741/gnome-shell-extension-inhibit-suspend/archive/f4e1f0f90c.zip)
md5sums=('f100b9befb92a32564803abcb7943f60')

package() {
  ext_dir="$pkgdir/usr/share/gnome-shell/extensions/"
  install -d "$ext_dir"
  cp -a "$srcdir"/$pkgname-"$_pkgver"*/inhibit-suspend@lavi.a "$ext_dir/"
}
# vim:set ts=2 sw=2 et: