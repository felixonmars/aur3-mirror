# Maintainer: Gordin <9ordin @t gmail dot com>
# Author: half-left <http://half-left.deviantart.com/>

pkgname=gnome-shell-theme-elementary-luna
pkgver=1.3
pkgrel=3
pkgdesc="This is a GNOME Shell theme based on the Elementary GTK2 theme."
url="http://half-left.deviantart.com/art/GNOME-Shell-Elementary-Luna-251149793"
license=('GPL3')
arch=('any')
makedepends=('unzip')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=('http://www.deviantart.com/download/251149793/gnome_shell___elementary_luna_by_half_left-d45j0f5.zip')
sha256sums=('a67c762a22edf724f16665aca1823d1c8664eed97534ed19e0f327201e96e8ea')

package() {
  cd "$srcdir/Elementary-Luna-3.4"

  rm -rf gnome-shell/LICENSE

  # Install the theme and remove backup files
  mkdir -p "$pkgdir/usr/share/themes/Elementary-Luna/gnome-shell"
  install -Dp -m0644 gnome-shell/* "$pkgdir/usr/share/themes/Elementary-Luna/gnome-shell"
  find "$pkgdir" -name *~ -type f -exec rm -f '{}' \;
}
