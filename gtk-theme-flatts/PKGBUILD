# Mantainer: defendor at riseup dot net

pkgname=gtk-theme-flatts
pkgver=1.0
pkgrel=1
pkgdesc="A colorful and flat GTK 3, GTK 2, Xfwm, Metacity, Unity and Openvbox theme suite."
arch=('any')
url="http://nale12.deviantart.com/art/Flatts-09022014-432924057?q=gallery%3Anale12&qo=0"
license=('GPL3')
depends=('gtk-engine-murrine')
_sourcefile=flatts_09022014_by_nale12-d75r2c9.zip
source=(http://fc01.deviantart.net/fs71/f/2014/040/2/b/${_sourcefile})
md5sums=('7ffb9a965ef1744a6e780b167c6e0344')

noextract=("${source[@]%%::*}")
_foldername=flatts_09022014_by_nale12-d75r2c9

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	mkdir "${_foldername}"
	unzip "${_sourcefile}" -d ${_foldername}
	cp -rv ${srcdir}/${_foldername}/* ${pkgdir}/usr/share/themes/
}