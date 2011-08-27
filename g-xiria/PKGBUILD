# Author: phlox (gnome.looks.org)
# Maintainer: yuginta <cowoplinplan@gmail.com>

pkgname=g-xiria
pkgver=2.0
pkgrel=1
pkgdesc="This is G-Xiria icon theme."
arch=('any')
url="http://http://www.maknyos.com/1djhu5vcuynh/G-Xiria_2.0.tar-maknyos.com.bz2.html/"
license=('GPLv2')
depends=('gtk2' 'hicolor-icon-theme')
source=(http://pdl3.maknyos.com/files/2/py8sxgr8v7odiv/G-Xiria_2.0.tar-maknyos.com.bz2)
md5sums=('9fd29a7cee566f7544f118f85d9ef2dc')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -r "G-Xiria 2.0" $startdir/pkg/usr/share/icons/
}
