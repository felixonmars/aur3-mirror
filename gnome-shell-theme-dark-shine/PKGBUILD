# Author:  Satyajit Sahoo (http://satya164.deviantart.com)
# Maintainer: David Runge <david[d]runge[a]frqrec[d]com>
pkgname=gnome-shell-theme-dark-shine
pkgver=20120622
pkgrel=1
pkgdesc="Dark variant of the shine theme." 
url="http://satya164.deviantart.com/art/Gnome-Shell-Dark-Shine-266329752"
license=('GPL')
arch=('any')
depends=('gnome-shell>=3.2')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/266329752/gnome_shell___dark_shine_by_satya164-d4ekdco.zip" "gdm.css")
md5sums=('62c78777f00964d69ba9f50aa1cef754' 'cb7ca93747589a9449e078b53fd4d313')

package() {
  msg "Installing theme to /usr/share/themes/Dark Shine"
  find "Dark Shine"*/ -not -name "*~" -type f \
      -exec install -vDm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  msg "Adding gdm.css"
  install -vDm644 $srcdir/gdm.css $pkgdir/usr/share/themes/Dark\ Shine/gnome-shell
}
# vim:set ts=2 sw=2 et:
