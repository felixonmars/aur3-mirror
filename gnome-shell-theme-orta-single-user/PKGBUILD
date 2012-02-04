# Author: half-left <http://half-left.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-orta-single-user
pkgver=1.0
pkgrel=1
pkgdesc="This is a GNOME Shell theme based on the Orta GTK2 
theme. No system wide installation."
url="https://half-left.deviantart.com/art/GNOME-Shell-Orta-207047273"
license=('GPL')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/207047273/gnome_shell___orta_by_half_left-d3f9qp5.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('a4f74be6ea5ca9e412e04128a0f4bc9e')

package() {
  mkdir -p ${pkgdir}$HOME/.themes/
  unzip gs-orta-dark.zip -d ${pkgdir}$HOME/.themes/
  unzip gs-orta.zip -d ${pkgdir}$HOME/.themes/
  chmod -R 755 ${pkgdir}$HOME/.themes/gs-orta
  chmod -R 755 ${pkgdir}$HOME/.themes/gs-orta-dark
}


