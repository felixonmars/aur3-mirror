# Mantainer: dmiranda at gmail dot com

pkgname=gtk-theme-yosemite
pkgver=2014.06.23
pkgrel=1
pkgdesc="An Elementary OS theme. Is a modified version of the default Elementary theme that looks like the "new" OS X 10.10."
arch=('any')
url="http://synetcon.deviantart.com/art/Yosemite-for-ElementaryOS-codename-Yellowstone-461282634"
license=('GPL3')
depends=('gtk-engine-unico')
_sourcefile=yosemite_for_elementaryos__codename_yellowstone__by_synetcon-d7mmvyi.zip
source=(http://fc07.deviantart.net/fs71/f/2014/172/4/c/yosemite_for_elementaryos__codename_yellowstone__by_synetcon-d7mmvyi.zip)
md5sums=('a8f1a0a3a6d3a49b9be9b297263b1660')

noextract=("${source[@]%%::*}")
_foldername=yellowstone2

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	mkdir "${_foldername}"
	unzip "${_sourcefile}" -d ${_foldername}
	cp -rv ${srcdir}/${_foldername}/* ${pkgdir}/usr/share/themes/
}
