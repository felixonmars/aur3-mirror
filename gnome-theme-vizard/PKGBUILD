# Author:   plaidcounty <http://plaidcounty.deviantart.com/>
# Maintainer: sanderd17 <sanderd17 at gmail dot com>

pkgname=gnome-theme-vizard
pkgver=20110919
pkgrel=1
pkgdesc="A bright GTK2, GTK3, Metacity and Gnome-Shell theme by plaidcounty" 
url="http://plaidcounty.deviantart.com/art/Vizard-259153244"
license=('GPLv3')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/259153244/vizard_by_plaidcounty-d4aajx8.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('2e57b74e052cd6ff032abd60a5d06953')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  unzip vizard_by_plaidcounty-d4aajx8.zip -d ${pkgdir}/usr/share/themes/

}


