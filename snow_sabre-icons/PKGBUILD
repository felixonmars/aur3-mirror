# Maintainer: Malina Salina <mali#archlinux>

pkgname=snow_sabre-icons
_pkgname=snow_sabre
pkgver=1.0
pkgrel=2
pkgdesc="Light and Dark (black & silver) icon theme for Gnome ported from MacOS from deviant art user minimamente."
arch=('any')
url="http://naf1971.deviantart.com/art/Snow-sabre-192507414?"
license=('GPL')
depends=()
optdepends=()
source=("http://goo.gl/DfsYvB")
sha1sums=('3de587f73b472b8a8c920e38678a675de2b1529f')

build() {
	cd ${srcdir}
	tar xvf data.tar.gz 
	}

package() {   
mkdir -p "${pkgdir}/usr/share/icons"
mkdir -p "${pkgdir}/usr/share/doc"
	mv ${srcdir}/usr/share/icons/* "${pkgdir}/usr/share/icons/"
    mv ${srcdir}/usr/share/doc/snow-sabre-icons "${pkgdir}/usr/share/doc/snow_sabre-icons"
	chmod -R 755 "${pkgdir}/usr/share/"
}

# vim:set ts=2 sw=2 et:
