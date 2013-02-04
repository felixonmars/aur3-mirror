# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-star-destroyer
pkgver=1
pkgrel=1
pkgdesc="Celestia addon: Fictional: Star Wars: Star Destroyer"
arch=(any)
url='http://www.celestiamotherlode.net/catalog/show_addon_details.php?addon_id=162'
license=('unknown, free')
depends=('celestia' 'celestia-addon-tatooine-endor-deathstar')
makedepends=('unzip')
source=('http://celestiamotherlode.net/creators/jestr/SW-StarDestroyer(big).zip')

package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/SW-StarDestroyer(big)/" "$pkgdir/usr/share/celestia/extras/"
}
md5sums=('670ea607572cc9335bd3cfa7f10aabf8')
