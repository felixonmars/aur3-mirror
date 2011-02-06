#Contributor: Lava186 <info@lavalab.org>

pkgname=warsow-map-pack-v1
pkgver=1.0
pkgrel=1
pkgdesc="A little collection with good warsow maps"
url="http://warsow.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('warsow' 'unzip')
source=(http://www.brushhour.org/wsw/warsownews-map_pack_v1.zip)
md5sums=('7e43ba21d80392b41f71cc43d160d921')

build()
{
	cd $startdir/src/
	mkdir -p $startdir/pkg/opt/warsow/basewsw
	cp *.pk3 $startdir/pkg/opt/warsow/basewsw
}