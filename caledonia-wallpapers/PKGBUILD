# Maintainer: sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg==|base64 -d>
# Contributor: cippaciong <lacapannadelloziotom [at] gmail [dot] com>

pkgname=caledonia-wallpapers
pkgver=1
pkgrel=1
pkgdesc="The official wallpaper collection for Caledonia"
arch=('any')
url=(http://malcer.deviantart.com/)
license=('CC-BY; CC-BY-SA')
depends=()
makedepends=()
source=('http://sourceforge.net/projects/caledonia/files/Caledonia%20Official%20Wallpapers/Caledonia_Official_Wallpaper_Collection.tar.gz')
sha256sums=('237401716f90466376e0fbbc6ece78b7cf13bb77de7dcc0ba9f91e4513424da2')

package() {
	mkdir -p -m755 "$pkgdir/usr/share/wallpapers"

	cd Caledonia_Official_Wallpaper_Collection
	rm README
	cp -rf * "$pkgdir/usr/share/wallpapers"
}
