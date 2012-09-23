# Author: half-left <http://half-left.deviantart.com/>
# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-theme-gaia
pkgver=20120923
pkgrel=1
pkgdesc="This is a GNOME Shell theme with a Gaia look and design."
url="http://half-left.deviantart.com/art/GNOME-Shell-Gaia-207574700?"
license=('GPL')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/207574700/gnome_shell___gaia_by_half_left-d3fl1nw.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('c36b2f7c945b9fa7f83ad0deffc049af')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/"
  cp -r "${srcdir}/Gaia" "${pkgdir}/usr/share/themes/"

  mkdir -p "${pkgdir}/usr/share/licenses/gnome-shell-theme-gaia"
  mv "${pkgdir}/usr/share/themes/Gaia/gnome-shell/LICENSE" "${pkgdir}/usr/share/licenses/gnome-shell-theme-gaia/"

  #find "${pkgdir}" -name '*~' -type f -exec rm -f '{}' \;
}

