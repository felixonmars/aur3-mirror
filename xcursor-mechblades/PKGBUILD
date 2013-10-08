#Maintainer: dongfengweixiao <dongfengweixiao at googlemail dot com>

pkgname=xcursor-mechblades
pkgver=2013.10.08
pkgrel=2
pkgdesc="A cursor theme."
arch=(i686 x86_64)
url=("http://grynays.deviantart.com/art/MechBlades-302828653")
license=('GPL')
depends=()
source=("http://gthemes-china.googlecode.com/files/MechBlades.tar.gz")
md5sums=('93e9923d0c157ca89bae32030f3a4d83')

package() {
	mkdir -p ${pkgdir}/usr/share/icons/mechblades/cursors
	cp MechBlades/*.theme ${pkgdir}/usr/share/icons/mechblades
	cp MechBlades/cursors/* ${pkgdir}/usr/share/icons/mechblades/cursors
}

