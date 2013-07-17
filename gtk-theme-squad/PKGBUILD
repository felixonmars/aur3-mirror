# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: pumbur <pumbur@ya.ru>

pkgname=gtk-theme-squad
pkgver=1
pkgrel=1
pkgdesc="sQuad"
arch=('any')
url="http://ebupof.deviantart.com/art/sQuad-144866688"
license=('CCPL-by-nc-sa')
depends=('gtk-engine-murrine')
source=(http://fc01.deviantart.net/fs51/f/2009/330/5/1/sQuad_by_ebupof.gz)
md5sums=('6e058e0eba2f6afbd784a09e68155936')

package() {
  mkdir -p $pkgdir/usr/share/themes
  cp -r $srcdir/sQuad $pkgdir/usr/share/themes
}

