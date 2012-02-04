# Author:   plaidcounty <http://plaidcounty.deviantart.com/>
# Maintainer: sanderd17 <sanderd17 at gmail dot com>

pkgname=gnome-shell-theme-capazul
pkgver=1.4
pkgrel=1
pkgdesc="A dark blue gnome shell 3.2 theme by plaidcounty" 
url="http://plaidcounty.deviantart.com/art/Capazul-261822655"
license=('GPLv3')
arch=('any')
depends=('gnome-shell>=3.2')
makedepends=('unzip')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/261822655/capazul_by_plaidcounty-d4bvrnj.zip")
md5sums=('71fd1e0be616791a233cabe66de98cbe')


build() {
  mkdir -p ${pkgdir}/usr/share/themes/
  mv ${srcdir}/Capazul ${pkgdir}/usr/share/themes/
}


