# Maintainer: schalox <schalox at gmail dot com>

pkgname=openbox-elementary-theme
pkgver=20110711
pkgrel=1
pkgdesc="Openbox theme for Elementary GTK."
arch=('any')
url="http://box-look.org/content/show.php/Elementary-Openbox?content=123840"
license=('CCPL:by-nc-sa')
depends=('openbox')
source=(http://www.deviantart.com/download/162079452/Elementary_Openbox_by_mirhciulica.zip)
md5sums=('f56b51eef78bf7818e01fdaf56586a08')

build() {
	/bin/true
}

package () {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/share/themes
	cp -R Elementary-Openbox ${pkgdir}/usr/share/themes/
}
