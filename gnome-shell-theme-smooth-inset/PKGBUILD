# Maintainer: Gordin <9ordin @t gmail dot com>
# Author: half-left <http://half-left.deviantart.com/>

pkgname=gnome-shell-theme-smooth-inset
pkgver=1.0
pkgrel=1
pkgdesc="This is a GNOME Shell theme based on the Elementary GTK2 theme."
url="http://half-left.deviantart.com/art/GNOME-Shell-Elementary-Luna-251149793"
license=('GPLv3' 'LGPLv2')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=('http://www.deviantart.com/download/200111295/gnome_shell___smooth_inset_by_half_left-d3b52v3.zip')
sha256sums=('5796dbd25da97a9a7e54eb3541201341d9ba90b3c46629a814fe21206c77f0f8')

package() {
  cd "$srcdir/gs-smooth-inset"

  # License file (Copy and remove)
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dp -m0644 gnome-shell/LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf gnome-shell/LICENSE

  # Install the theme and remove backup files
  mkdir -p "$pkgdir/usr/share/themes/Smooth Inset/gnome-shell"
  install -Dp -m0644 gnome-shell/* "$pkgdir/usr/share/themes/Smooth Inset/gnome-shell"
  find "$pkgdir" -name *~ -type f -exec rm -f '{}' \;
}
