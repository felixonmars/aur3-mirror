# Maintainer: blackleg <blackleg@lavabit.com>

pkgname=flightgear-utils
pkgver=1
pkgrel=1
pkgdesc="Blackleg Flightgear Utils"
url="http://github.com/blackleg/blackleg-utils"
arch=('any')
license=('GPL3')
depends=("flightgear")
source=("http://github.com/blackleg/blackleg-utils/archive/v1.zip")

md5sums=('9a5590b7fc806c7613a66b62308aef4f')


package() {
	cd "${srcdir}/blackleg-utils-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	install flightgear "${pkgdir}/usr/bin"
}
