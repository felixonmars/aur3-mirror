# Author:    half-left <http://half-left.deviantart.com/>
# Maintainer: sanderd17 <sanderd17 at gmail dot com>

pkgname=gnome-shell-theme-ultra
pkgver=20111102
pkgrel=1
pkgdesc="A slick dark Gnome-Shell theme by half-left." 
url="http://half-left.deviantart.com/art/GNOME-Shell-ULTRA-266122718"
license=('GPL')
arch=('any')
depends=('gnome-shell>=3.2')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/266122718/gnome_shell____ultra_by_half_left-d4efxlq.zip")
md5sums=('718a3518c52b21b7636d4acedce435c0')



build() {
  mkdir -p ${pkgdir}/usr/share/themes/
  mv ${srcdir}/ULTRA ${pkgdir}/usr/share/themes/
}


