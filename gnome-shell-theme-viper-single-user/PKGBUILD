# Author:   half-left <http://half-left.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-viper-single-user
pkgver=20110924
pkgrel=1
pkgdesc="A blue-black and a green-black Gnome-Shell theme by Half-Left. No system wide installtion." 
url="http://half-left.deviantart.com/art/GNOME-Shell-Viper-213598541"
license=('GPLv3')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/213598541/gnome_shell___viper_by_half_left-d3j65ot.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('627b26c50af42570db101b8ee9699195')

package() {
  mkdir -p ${pkgdir}$HOME/.themes/
  unzip gnome_shell___viper_by_half_left-d3j65ot.zip -d ${pkgdir}$HOME/.themes/


  unzip ${pkgdir}$HOME/.themes/gs-viper-green.zip -d ${pkgdir}$HOME/.themes/
  unzip ${pkgdir}$HOME/.themes/gs-viper.zip -d ${pkgdir}$HOME/.themes/
}


