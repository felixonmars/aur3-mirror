# Contributor: Juan Diego Tascon

pkgname=vpipe
pkgver=0.0.2
pkgrel=1
pkgdesc="Pipe for the vloopback device"
url="http://www.zoneminder.com/wiki/index.php/Vpipe"
depends=()
conflicts=()
license=('GPL')
arch=('i686' 'x86_64')

source=("http://download.astronomix.org/${pkgname}-${pkgver}.tgz")
md5sums=('35286eb14941c096a1cac6c1e71f75b2')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make clean || return 1
	make || return 1
	
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/usr/bin
}
