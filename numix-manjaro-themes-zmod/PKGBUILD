# Maintainer: Zbynek Moravec <zbynek@ithvezda.cz>
# Contributor: Zbynek Moravec <zbynek@ithvezda.cz>

pkgname=numix-manjaro-themes-zmod
pkgver=1
pkgrel=1
pkgdesc="Windows decoration straight mod"
arch=('any')
url="http://zbynek.php5.cz"
license=('GPL3')
depends=('numix-manjaro-themes')
source=("https://dl.dropboxusercontent.com/s/ffe39f60fwtv7l6/Numix-Manjaro-Straight-zMod.tar.gz")
md5sums=('bcf23c2959bda1961021be4179182584')


package() {
	themesDir=${pkgdir}/usr/share/themes/
	install -d ${themesDir}
	tar xzvf ./Numix-Manjaro-Straight-zMod.tar.gz -C ${themesDir}
}

