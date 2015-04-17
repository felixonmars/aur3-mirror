# Maintainer: ybznek

pkgname="decdump"
pkgver=1beta
pkgrel=1
pkgdesc="Simple ascii code displayer filter"
arch=('any')
url="http://zbynek.php5.cz"
depends=('gcc')
license=('GPL3')
source=('Makefile' 'decdump.c')
 
package() {
	install -m755 -d ${pkgdir}/usr/bin
	make
	cp ./decdump ${pkgdir}/usr/bin/decdump
	chmod 755 ${pkgdir}/usr/bin/decdump

}

md5sums=('81108eaea9e52df886fc8862978329e0' 'ca7f99a872575290d3e398271b70a9d1')
