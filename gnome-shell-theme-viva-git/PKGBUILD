# Maintainer: SuperBo <supernbo@gmail.com>

pkgname=gnome-shell-theme-viva-git
pkgver=20150413
pkgrel=1
pkgdesc="Gnome-Shell theme by vivaeltopo, based upon the original Adwaita theme and his previous theme"
arch=('any')
url="https://github.com/vivaeltopo/gnome-shell-theme-viva"
license=('CCPL:by-nc-sa')
depends=('gnome-shell' 'ttf-impallari-raleway-family' 'ttf-opensans')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=('git://github.com/vivaeltopo/gnome-shell-theme-viva.git')
sha256sums=('SKIP')

_gitname="gnome-shell-theme-viva"

package() {
  mkdir -p $pkgdir/usr/share/themes/viva
  cd "$srcdir/$_gitname"
  cp -pr gnome-shell "$pkgdir/usr/share/themes/viva/"
}

# vim:set ts=2 sw=2 et:
