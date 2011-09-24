# Author: half-left <http://half-left.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-gaia-single-user
pkgver=20110904
pkgrel=1
pkgdesc="This is a GNOME Shell theme with a Gaia look and design. No system wide installation."
url="http://half-left.deviantart.com/art/GNOME-Shell-Gaia-207574700?"
license=('GPL')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/207574700/gnome_shell___gaia_by_half_left-d3fl1nw.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('6876877e2d140071aa1b5a18eb5a4da2')

package() {
  mkdir -p ${pkgdir}$HOME/.themes/
  unzip gnome_shell___gaia_by_half_left-d3fl1nw.zip -d ${pkgdir}$HOME/.themes/
  rm ${pkgdir}$HOME/.themes/gs-gaia/gnome-shell/*~
  chmod -R 755 ${pkgdir}$HOME/.themes/gs-gaia/gnome-shell
}

