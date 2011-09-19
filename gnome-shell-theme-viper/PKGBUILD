# Author:   half-left <http://half-left.deviantart.com/>
# Maintainer: sanderd17 <sanderd17 at gmail dot com>

pkgname=gnome-shell-theme-viper
pkgver=20110919
pkgrel=1
pkgdesc="A blue-black and a green-black Gnome-Shell theme by Half-Left" 
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
  mkdir -p ${pkgdir}/usr/share/themes/
  unzip gnome_shell___viper_by_half_left-d3j65ot.zip -d ${pkgdir}/usr/share/themes/


  unzip ${pkgdir}/usr/share/themes/gs-viper-green.zip -d ${pkgdir}/usr/share/themes/
  unzip ${pkgdir}/usr/share/themes/gs-viper.zip -d ${pkgdir}/usr/share/themes/
}


