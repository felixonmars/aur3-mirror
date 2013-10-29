# Maintainer: blackleg <blackleg@lavabit.com>

pkgname=fgcom
pkgver=2.99
pkgrel=1
pkgdesc="VoIP client for FlightGear"
url="http://fgcom.flightgear.org/"
arch=('x86_64')
license=('GPL')
depends=('openal' 'plib' 'simgear')
makedepends=("cmake")
optdepends=("flightgear")
source=("http://flightgear.simpits.org:8080/job/FGCom64/lastSuccessfulBuild/artifact/FGCom/*zip*/FGCom.zip")

md5sums=('c47d805dea2f483e275b43c0d5d28ac4')


package() {
	cd "${srcdir}"
 
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/flightgear"
	
	install ./bin/* "${pkgdir}/usr/bin/"
	install ./share/flightgear/* "${pkgdir}/usr/share/flightgear"

	
	
	
}
