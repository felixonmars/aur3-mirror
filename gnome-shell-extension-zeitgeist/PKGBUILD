# Author: Seif Lotfy
# Maintainer: sanderd17 <sanderd17 at gmail dot com>

pkgname=gnome-shell-extension-zeitgeist
pkgver=20111005
pkgrel=2
pkgdesc="An extension to have another activities menu which shows zeitgeist search results" 
url="http://seilo.geekyogre.com/2011/10/zeitgeist-extensions-for-gnome-shell/"
license=('unknown')
arch=('any')
depends=('gnome-shell>=3.2'
         'libqzeitgeist')
makedepends=('unzip')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://db.tt/1APxzqac")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('edc9326304dcebed732f3bf0ebf837be')

package() {
  mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/
  mv ${srcdir}/gimm*  ${pkgdir}/usr/share/gnome-shell/extensions/


}


