# Maintainer: Alucryd <alucryd at gmail dot com>
pkgname=gnome-shell-theme-atolm
pkgver=3.4
pkgrel=1
pkgdesc="A GNOME Shell theme based on the Atolm GTK2 theme"
url="http://half-left.deviantart.com/art/GNOME-Shell-Atolm-204534789"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=('http://www.deviantart.com/download/204534789/gnome_shell____atolm_by_half_left-d3drw1x.zip')
md5sums=('9491b62350cc02e9bc86f9160e63da51')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/themes"
  mv Atolm-3.4 "$pkgdir/usr/share/themes/Atolm"
  chmod 755 -R "$pkgdir/usr/share/themes"
}
