# Author: Oberon27 <http://oberon27.deviantart.com/>
# Maintainer: h0neycrysp <h0neycrysp@gmail.com>

pkgname=gnome-shell-theme-adwaita-white
pkgver=1.4
pkgrel=1
pkgdesc="This is a white version of the Adwaita gnome-shell theme."
url="http://half-left.deviantart.com/art/Adwaita-White-212572423"
arch=('any')
license=('')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/212572423/adwaita_white_by_oberon27-d3ik5xj.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('4241c57fb33aaa0cf1def7ea6b73dbbd')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  unzip adwaita_white_by_oberon27-d3ik5xj.zip -d ${pkgdir}/usr/share/themes/
  chmod -R 755 ${pkgdir}/usr/share/themes/Adwaita-White
}

