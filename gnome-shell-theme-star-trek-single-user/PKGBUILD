# Author:   samriggs <http://samriggs.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-star-trek-single-user
pkgver=2011092r40
pkgrel=1
pkgdesc="A blue Star Trek Gnome-Shell theme by samriggs. No system wide installation." 
url="http://samriggs.deviantart.com/art/Star-Trek-Blue-259235585"
license=('GPLv3')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/259235585/star_trek_blue_by_samriggs-d4acbgh.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('277f79142f54080ca742d09693840502')

package() {
  mkdir -p ${pkgdir}$HOME/.themes/
  unzip star_trek_blue_by_samriggs-d4acbgh.zip -d ${pkgdir}$HOME/.themes/
  mv ${pkgdir}$HOME/.themes/Star\ Trek\ Blue/ ${pkgdir}$HOME/.themes/Star-Trek-Blue/
  chmod 755 ${pkgdir}$HOME/.themes/Star-Trek-Blue/gnome-shell
}


