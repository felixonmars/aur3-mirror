# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-millenium-falcon
pkgver=1
pkgrel=1
pkgdesc="Celestia addon: Fictional: Star Wars: Millenium Falcon"
arch=(any)
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=159'
license=('unknown, free')
depends=('celestia' 'celestia-addon-tatooine-endor-deathstar')
makedepends=('unzip')
source=('http://celestiamotherlode.net/creators/jestr/SW-Falcon.zip')

package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/SW-Falcon/" "$pkgdir/usr/share/celestia/extras/"
}
md5sums=('43d21711998265e8bff5704398625d0c')
