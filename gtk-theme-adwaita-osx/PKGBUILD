# Mantainer: dmiranda at gmail dot com

pkgname=gtk-theme-adwaita-osx
pkgver=2014.03.19
pkgrel=1
pkgdesc="A Mac OS X theme for gtk. It works perfect with gnome and elementary apps. Dark theme included. GTK 3.10 and GTK 3.12."
arch=('any')
url="http://fc03.deviantart.net/fs70/f/2014/062/1/a/adwaita_os_x_by_kxmylo-d757nc7.zip"
license=('GPL3')
depends=('gtk-engine-murrine')
_sourcefile=adwaita_os_x_by_kxmylo-d757nc7.zip
source=(http://fc03.deviantart.net/fs70/f/2014/062/1/a/adwaita_os_x_by_kxmylo-d757nc7.zip)
md5sums=('2f69bae27fc83c952e1e9bfc663cbb0a')

noextract=("${source[@]%%::*}")
_foldername=adwaita_os_x_by_kxmylo-d757nc7

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	mkdir "${_foldername}"
	unzip "${_sourcefile}" -d ${_foldername}
	cp -rv ${srcdir}/${_foldername}/* ${pkgdir}/usr/share/themes/
}
