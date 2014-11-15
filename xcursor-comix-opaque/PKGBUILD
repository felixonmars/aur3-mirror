# Contributor: Michal Bednar <michal.bednar@gmail.com>
# Maintainer: Michal Bednar <michal.bednar@gmail.com>

pkgname=xcursor-comix-opaque
pkgver=0.8.2
pkgrel=3
pkgdesc="ComixCursors-Opaque"
url="http://opendesktop.org/content/show.php/ComixCursors?content=32627"
depends=('libxcursor')
license=('GPL')
arch=('any')
source=('http://www.limitland.de/comixcursors/ComixCursors-Opaque-0.8.2.tar.bz2')

build(){
	mkdir -p $pkgdir/usr/share/icons
	cp -R $srcdir/ComixCursors-Opaque-[A-Z]* $pkgdir/usr/share/icons
}

md5sums=('0be83a297d8763320322c2f8068e0806')
