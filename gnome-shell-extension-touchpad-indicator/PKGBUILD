# Submitter: Gently <toddrpartridge@gmail.com>

pkgname=gnome-shell-extension-touchpad-indicator
pkgver=3.80
_pkgver=f56c5cc0a7
pkgrel=1
pkgdesc="Minimalistic Touchpad management extension"
arch=(any)
url="https://extensions.gnome.org/extension/131/touchpad-indicator/"
license=('GPL2')
depends=('gnome-shell')
replaces=('gnome-shell-extension-touchpad-indicator-git')
install=gschemas.install
source=(https://github.com/orangeshirt/gnome-shell-extension-touchpad-indicator/archive/"$_pkgver".zip)
md5sums=('39a38fea9e857a04bfdc83c1015731f6')

package() {
  ext_dir="$pkgdir/usr/share/gnome-shell/extensions/"
  ext_sub="$ext_dir/touchpad-indicator@orangeshirt"
  install -d "$ext_dir"
  cp -a "$srcdir/$pkgname"-"$_pkgver"* "$ext_sub"
  # Temp fix to update to 3.8
  sed -i 's/3.6/3.8/' "$ext_sub"/metadata.json
}
# vim:set ts=2 sw=2 et:
