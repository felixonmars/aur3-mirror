# Author: Oberon27 <http://oberon27.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-adwaita-white-single-user
pkgver=1.3
pkgrel=1
pkgdesc="This is a white version of the Adwaita gnome-shell theme. No system wide installation."
url="http://half-left.deviantart.com/art/Adwaita-White-212572423"
arch=('any')
license=('')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/212572423/adwaita_white_by_oberon27-d3ik5xj.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('cf22bb908d4f89b629646003ad76c90c')

package() {
  mkdir -p ${pkgdir}$HOME/.themes/
  unzip adwaita_white_by_oberon27-d3ik5xj.zip -d ${pkgdir}$HOME/.themes/
  chmod -R 755 ${pkgdir}$HOME/.themes/Adwaita-White
}

