# Maintainer: Joekey <joekey1@gmail.com>
pkgname=airstrike
pkgver=pre6a
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Airstrike is a 2d dogfighting game"
makedepends=('automake' 'gcc' 'sdl')
provides=('airstrike')
conflicts=('airstrike')
url="http://icculus.org/airstrike/"
license=('GPL')
install=('install.sh')
source=(http://icculus.org/airstrike/$pkgname-$pkgver-src.tar.gz
        airstrike.sh
        airstrike.desktop)

md5sums=('af7367f9223309fbcf9759e04028394e'
         'f2cd7cba46b1e2d1547c1c176ef01beb' 
	 '03434e1bb92899b6f22b2c20ac3f5636')

build() {
	mkdir -p $startdir/pkg/opt/
        mkdir -p $startdir/pkg/opt/games
        mkdir -p $startdir/pkg/usr/bin
        cd $pkgname-$pkgver-src       
        make || return 1
        mv $startdir/src/$pkgname-$pkgver-src $startdir/pkg/opt/games/

        touch $startdir/pkg/usr/bin/airstrike &&
        chmod +x $startdir/pkg/usr/bin/airstrike & 
	install -m755 $startdir/airstrike.sh $startdir/pkg/usr/bin/
	

}
