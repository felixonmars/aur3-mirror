#$Id: $
#Maintainer: Mirko Messer <mirk@chao.ch>
#-*-mode:sh-*-
#Contributor: 
#Comments:
pkgname=wmmemfree
pkgver=0.7
pkgrel=1
pkgdesc="dockapp which displays mem"
url="http://dockapps.org/file.php/id/165/"
license=""
depends=('xorg')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://dockapps.org/download.php/id/250/wmmemfree-0.7.tar.bz2 \
1.patch
)
md5sums=('6b478209d907dd2955828e71319af757' '774edf24c30d3a66df194c974cc7bb0c')

build() {
        mkdir -p $startdir/pkg/usr/bin
	cd $startdir/src/$pkgname-$pkgver
        patch -p0 < ../../1.patch
	make
        install -m 755 wmmemfree $startdir/pkg/usr/bin
}
 
 
