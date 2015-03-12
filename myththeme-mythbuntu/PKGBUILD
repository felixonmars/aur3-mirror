# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=myththeme-mythbuntu
pkgver=28.20
pkgrel=1
pkgdesc="Mythbuntu theme for MythTV"
arch=('any')
url="https://github.com/MythTV-Themes/Mythbuntu"
license=('GPL2')
depends=('mythtv>=0.27' 'ttf-dejavu')
source=("https://github.com/MythTV-Themes/Mythbuntu/archive/master.zip")
md5sums=('53107a1bf28a2a03b0caca4dcda6db74')

package() {
	mkdir -p "$pkgdir/usr/share/mythtv/themes/"
	cp -r "$srcdir/Mythbuntu-master" "$pkgdir/usr/share/mythtv/themes/Mythbuntu"
}
