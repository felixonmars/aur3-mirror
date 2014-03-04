# Maintainer: blackleg <blackleg@openmailbox.org>

pkgname=flightgear-shuttle
pkgver=1
pkgrel=1
pkgdesc="Nasa Shuttle FlightGear"
url="https://gitorious.org/space-shuttle"
arch=('any')
license=('unknown')
depends=("flightgear" "flightgear-utils")
source=("flightgear-shuttle.desktop" 
	"https://gitorious.org/space-shuttle/shuttle/archive/ae308b56ebf7e12033d29227a3ebe8f37eb8b9d3.tar.gz")

md5sums=('fe14add4c74578f204f84fb69cb61001'
         'e63b107702dbe4b355b2c4dea22a22a2')


package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/flightgear/data/Aircraft"
	cp -r space-shuttle-shuttle	"${pkgdir}/usr/share/flightgear/data/Aircraft/shuttle"
	mkdir -p "${pkgdir}/usr/share/applications"
	install -m 644 flightgear-shuttle.desktop "${pkgdir}/usr/share/applications/"
	
	#cd "${pkgdir}/usr/share/flightgear/data/Aircraft/787-8"

	#mkdir -p "${pkgdir}/usr/share/icons"
	#cp splash.png "${pkgdir}/usr/share/icons/787.png"
}
