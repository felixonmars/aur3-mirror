# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=checksums
pkgver=0.4
pkgrel=2
pkgdesc="Service menu and a small script for calculation of md5, sha1 and sha256 checksums. Based on KonqCheckSum service menu"
url="http://kde-look.org/content/show.php/KonqCheckSum?content=83460"
depends=('kdebase-workspace')
optdepends=()
options=()
license=('GPL')
arch=('any')

source=(checksums.desktop
	checksums.sh)    
md5sums=('94b14c8139ab72700638edf53b9354d7'
         'f23f7ff8d8bc527bc08741c5da0f12bd')

build() {
	cd ${srcdir}
	install -D -m 755 checksums.sh ${pkgdir}/usr/bin/checksums.sh
	install -D -m 755 checksums.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/checksums.desktop
}
