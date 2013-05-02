# Maintainer: blackleg <hectorespertpardo@gmail.com>

pkgname=flightgear-spain
pkgver=2.10
pkgrel=1
pkgdesc="FlightGear Spain Scenery package"
url="http://www.flightgear.org/download/scenery/"
arch=("any")
license=('GPL')
depends=("flightgear")

source=("http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Scenery-v2.10/e000n40.tgz"
	"http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Scenery-v2.10/w010n40.tgz"
	"http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Scenery-v2.10/e000n30.tgz"
	"http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Scenery-v2.10/w010n30.tgz")

md5sums=('77d49b84e3267b6d1deb7c821d9ece01'
         'e73e9d34bdea1fd99bff6c740aa70523'
         'e97db0086afea6b7be147011ac55e6d1'
         '83be83c97394273944d59b4ad8bd1dc9')


package() {
	 
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/flightgear/data/Scenery"
	
	cp -r -u ./Objects "$pkgdir/usr/share/flightgear/data/Scenery"
	cp -r -u ./Terrain "$pkgdir/usr/share/flightgear/data/Scenery"
}
