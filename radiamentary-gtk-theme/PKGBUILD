# Maintainer: paterbrown <paterbrown at silberhelme dot de>
# Contributor: Daniel Milde <info@milde.cz>

pkgname=radiamentary-gtk-theme
_pkgname=
pkgver=0.66
pkgrel=1
pkgdesc="Basically a elementary mod with more blue and some radiance."
arch=('any')
url="http://nanabuluku.deviantart.com/art/Radiamentary-255615403?	"
license=('GPL2')s
depends=('gtk-engine-murrine')
optdepends=('elementary-icons: the elementary icon theme [AUR]')
source=(http://www.deviantart.com/download/255615403/radiamentary_by_nanabuluku-d486q3v.zip)
md5sums=('44205ffd6872be2112d9185b71356231')
install=radiamentary-gtk-theme.install

build () {
	mkdir -p ${pkgdir}/usr/share/themes
	cp -r ${srcdir}/Radianceblue_0_66 ${pkgdir}/usr/share/themes/Radiamentary
}
	
