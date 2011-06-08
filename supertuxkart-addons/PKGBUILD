# Maintainer: vinilox
# Contributor: vinilox
pkgname=supertuxkart-addons
pkgver=0.7
pkgrel=6
pkgdesc="Extra karts not included in the offical release - only compatible with STK 0.7.x"
arch=('any')
url="http://supertuxkart.sourceforge.net"
license=('GPL')
depends=('supertuxkart>=0.7')
makedepends=('p7zip')
source=("http://sourceforge.net/projects/supertuxkart/files/SuperTuxKart%20Add-ons/Add-ons%200.7/STK_0.7_Karts_AddonsPack.7z")
md5sums=('de39f5914fc19df83125bb8c154ce13b')

build() {
	mkdir -p ${pkgdir}/usr/share/supertuxkart/data/
	7z x -o${pkgdir}/usr/share/supertuxkart/data/ STK_0.7_Karts_AddonsPack.7z
	cp -R ${pkgdir}/usr/share/supertuxkart/data/Data/karts ${pkgdir}/usr/share/supertuxkart/data/karts/
	chmod -R 755 ${pkgdir}/usr/share/supertuxkart/data/karts/
	rm -rf ${pkgdir}/usr/share/supertuxkart/data/Data
}
