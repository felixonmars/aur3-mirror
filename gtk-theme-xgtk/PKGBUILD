# Mantainer: dmiranda at gmail dot com

pkgname=gtk-theme-xgtk
pkgver=2014.07.14
pkgrel=1
pkgdesc="Mac OS X Yosemite theme for gtk.
To use it you should have gtk 3.14."
arch=('any')
url="https://dl.dropboxusercontent.com/u/39261980/XGTK-3.14.zip"
license=('GPL3')
depends=('gtk-engine-murrine')
_sourcefile=XGTK-3.14.zip
source=(https://dl.dropboxusercontent.com/u/39261980/XGTK-3.14.zip)
md5sums=('d437f6623496e48997fc2ef822e7cdb9')

noextract=("${source[@]%%::*}")
_foldername=xgtk_theme_by_kxmylo-d7oyqvg

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	mkdir "${_foldername}"
	unzip "${_sourcefile}" -d ${_foldername}
	cp -rv ${srcdir}/${_foldername}/* ${pkgdir}/usr/share/themes/
}
