# Author: ALEX3ME <http://alex3me.deviantart.com/> 
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-x3me-single-user
pkgver=1
pkgrel=1
pkgdesc="A dark grey GNOME Shell theme with a smooth feel. No system wide installation."
url="http://alex3me.deviantart.com/#/d46rwnq"
license=('GPL')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/253244438/gnome_shell___x3me_by_alex3me-d46rwnq.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('97ff7f85ba11c5ae3d960d3d8289103a')

package() {
  mkdir -p "${pkgdir}$HOME/.themes/"

  # extract only the Archlinux branded variant
  unzip "${srcdir}/X3ME - Arch.zip" -d "${pkgdir}$HOME/.themes/"
  chmod -R 755 "${pkgdir}$HOME/.themes/X3ME - Arch"
}

