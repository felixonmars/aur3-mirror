#Maintainer: dongfengweixiao <dongfengweixiao at googlemail dot com>

pkgname=xcursor-thecandyman-red
pkgver=2013.10.08
pkgrel=2
pkgdesc="TheCandyman Red cursor theme."
arch=(i686 x86_64)
url=("http://grynays.deviantart.com/art/TheCandymanRed-257330466")
license=('GPL')
depends=()
source=("http://gthemes-china.googlecode.com/files/thecandymanred_by_grynays-d497hgi.zip")
md5sums=('99f3d2434d396e1934cecacbc14270bd')

package() {
	mkdir -p ${pkgdir}/usr/share/icons/TheCandymanRed/cursors
	cp TheCandymanRed/*.theme ${pkgdir}/usr/share/icons/TheCandymanRed
	cp TheCandymanRed/cursors/* ${pkgdir}/usr/share/icons/TheCandymanRed/cursors
}
#http://grynays.deviantart.com/#/d497hgi
