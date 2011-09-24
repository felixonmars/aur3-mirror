# Author: half-left <http://half-left.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-slave-single-user
pkgver=1.1
pkgrel=1
pkgdesc="This is a GNOME Shell theme based on SLAVE - a Windows 7 theme. No system wide installation"
url="http://half-left.deviantart.com/art/GNOME-Shell-SLAVE-254075556"
license=('GPL')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/254075556/gnome_shell___slave_by_half_left-d479pyc.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('64657c1f59ad3e1b6aed5ad47589531e')

package() {
  mkdir -p "${pkgdir}$HOME/.themes/"
  mv "${srcdir}/SLAVE" "${pkgdir}$HOME/.themes/"
  rm ${pkgdir}$HOME/.themes/SLAVE/gnome-shell/*~
}

