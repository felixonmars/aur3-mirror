# Submitter: Gen2ly <toddrpartridge@gmail.com>

pkgname=gnome-shell-extension-status-only-icon
_pkgname=gnome-shell-status-only-icon
pkgver=3.60
_pkgver=de13539de2
pkgrel=1
pkgdesc="Display just an icon for status menu"
arch=(any)
url="https://extensions.gnome.org/extension/40/status-only-icon/"
license=('GPL2')
depends=('gnome-shell')
conflicts=('gnome-shell-extension-status-only-git')
source=(https://github.com/llaumgui/gnome-shell-status-only-icon/archive/"$_pkgver".zip)
md5sums=('76af7089730f966a1fd0c2544fda07b2')

package() {
  ext_dir="$pkgdir/usr/share/gnome-shell/extensions/"
  install -d "$ext_dir"
  cp -a "$srcdir"/$_pkgname-"$_pkgver"*/status-only-icon@llaumgui.com "$ext_dir/"
}
# vim:set ts=2 sw=2 et: