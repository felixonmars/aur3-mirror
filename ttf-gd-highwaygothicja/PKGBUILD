# Maintainer: 7kry <kt@7kry.net>

pkgname=ttf-gd-highwaygothicja
pkgver=108b
pkgrel=1
pkgdesc='The japanese highway-gothic font (TTF version).'
arch=(any)
url="http://www.hogera.com/pcb/font/"
license=('custom')
source=(http://www.hogera.com/pcb/font/arc/GDHighwayGoJA-Rev${pkgver}-TTF.zip)
md5sums=(9dc104d86b007123cd018b8491a71289)
optdepends=('otf-gd-highwaygothicja: OTF version')
install=ttf.install

package() {
	cd ${srcdir}
	install -d ${pkgdir}/usr/share/fonts/TTF
	install -m644 GDHighwayGoJA-Rev${pkgver}-TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF
	install -D -m644 GDHighwayGoJA-Rev${pkgver}-TTF/readme.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt
}
