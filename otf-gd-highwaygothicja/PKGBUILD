# Maintainer: 7kry <kt@7kry.net>

pkgname=otf-gd-highwaygothicja
pkgver=111b
pkgrel=1
pkgdesc='The japanese highway-gothic font (OTF version).'
arch=(any)
url="http://www.hogera.com/pcb/font/"
license=('custom')
source=(http://www.hogera.com/pcb/font/arc/GDHighwayGoJA-Rev${pkgver}-OTF.zip)
md5sums=(188faacc88c3141f2298996d08be7e87)
optdepends=('ttf-gd-highwaygothicja: TTF version')
install=otf.install

package() {
	cd ${srcdir}
	install -d ${pkgdir}/usr/share/fonts/OTF
	install -m644 GDHighwayGoJA-Rev${pkgver}-OTF/*.otf ${pkgdir}/usr/share/fonts/OTF
	install -D -m644 GDHighwayGoJA-Rev${pkgver}-OTF/readme.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt
}
