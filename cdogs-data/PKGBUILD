# Contributor: nut543 <kfs1@online.no>
pkgname=cdogs-data
pkgver=0.3
pkgrel=1
pkgdesc="data for CDogs"
arch=('i686' 'x86_64')
url="http://lumaki.com/code/cdogs"
#license=("freeware")
#depends=('sdl' 'sdl_mixer')
source=(http://icculus.org/cdogs-sdl/files/cdogs-data-current.tar.bz2)
md5sums=('110a9d40727bf89d96e2bf2858ac71a6')
build() {
cd $startdir/src/${pkgname}-200*
mkdir -p $startdir/pkg/usr/share/games/cdogs
mv * $startdir/pkg/usr/share/games/cdogs
}
