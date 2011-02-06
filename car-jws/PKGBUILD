#Contributor: Philipp Schwarz <fidschi_aur@temporaryforwarding.com>
pkgname=car-jws
pkgver=current
pkgrel=3
pkgdesc="Circle and Ruler is a dynamic geometry program. This Java WebStart package of CAR always runs the most current version directly out of the internet."
arch=('i686' 'x86_64')
license="GPL"
depends=('java-runtime')
makedepends=()
url="http://www.z-u-l.de"
source=()
md5sums=()
build() {
	cd ${startdir}
	mkdir -p ${startdir}/pkg/opt/car-jws
	cp car.png ${startdir}/pkg/opt/car-jws/
	cp car-jws ${startdir}/pkg/opt/car-jws/

	mkdir -p $startdir/pkg/usr/share/applications
	cp -f car-jws.desktop $startdir/pkg/usr/share/applications/
} 
