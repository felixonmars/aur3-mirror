# Author:  Satyajit Sahoo (http://satya164.deviantart.com)
# Maintainer: David Runge <david[d]runge[a]frqrec[d]com>
pkgname=gnome-shell-theme-shine
pkgver=20120622
pkgrel=1
pkgdesc="A transparant gnome-shell theme with smooth effects and a squarish look"
arch=('any')
url="http://satya164.deviantart.com/art/Gnome-Shell-Shine-265815777"
license=('GPL')
depends=('gnome-shell>=3.2')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell')
source=("http://www.deviantart.com/download/265815777/gnome_shell___shine_by_satya164-d4e9crl.zip" "gdm.css")
md5sums=('95547a8dd34dcdbbc698f4f803c22390' 'cb7ca93747589a9449e078b53fd4d313')

package() {
  msg "Installing theme to /usr/share/themes/Shine"
  find Shine*/ -not -name "*~" -type f \
      -exec install -vDm644 "{}" "$pkgdir/usr/share/themes/{}" \;
  msg "Adding gdm.css"
  install -vDm644 $srcdir/gdm.css $pkgdir/usr/share/themes/Shine/gnome-shell
}
# vim:set ts=2 sw=2 et:
