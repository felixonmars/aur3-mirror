# Author:   plaidcounty <http://plaidcounty.deviantart.com/>
# Maintainer: David Runge <david[d]runge[a]frqrec[d]com>
pkgname=gnome-shell-theme-prismas
pkgver=1.0
pkgrel=3
pkgdesc="Opaque gnome-shell themes in different color flavours: blue, gray, green, orange, purple, pink and red."
url="http://plaidcounty.deviantart.com/art/Prismas-Gnome-Shell-Theme-265934909"
license=('GPL')
arch=('any')
depends=('gnome-shell>=3.2')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/265934909/prismas_by_plaidcounty-d4ebwot.zip")
md5sums=('74e2d23df18c15481fa13c923a1565b3')

package() {
  cd ${srcdir}
  msg "Unpacking theme files."
  find ${srcdir}/ -name '*.tar.gz' -type f -print -exec tar -xzf "{}" -C . \;
  msg "Installing theme files to /usr/share/themes/"
  find */ \( ! -name '*.tar.gz' \) \( ! -name '*~' \) \( ! -name '*.zip' \) -type f \
  -exec install -vDm644 "{}" ${pkgdir}/usr/share/themes/{} \;
}
# vim:set ts=2 sw=2 et:
