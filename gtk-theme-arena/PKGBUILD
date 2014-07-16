#Maintainer: olantwin <olantwin at gmail dot com>

pkgname=gtk-theme-arena
pkgver=2014.07.14
pkgrel=1
pkgdesc="Arena is a gtk theme for gnome desktop and for elementary apps as well. It is simple and nice."
arch=('any')
url="http://kxmylo.deviantart.com/art/Arena-455414425"
license=(unknown)
depends=('gtk-engine-murrine')
_sourcefile=arena_by_kxmylo-d7j540p.zip
source=("http://fc03.deviantart.net/fs71/f/2014/195/6/a/arena_by_kxmylo-d7j540p.zip")
md5sums=('6b751be42ce414159a2731d1afb4a0d2')

noextract=("${source[@]%%::*}")
_foldername=arena_by_kxmylo-d7j540p

package () {
	mkdir -p ${pkgdir}/usr/share/themes/
	mkdir "${_foldername}"
	unzip "${_sourcefile}" -d ${_foldername}
	rm -rf ${_foldername}/arena/.bzr
	rm -rf ${_foldername}/arena/index.theme~
	cp -rv ${srcdir}/${_foldername}/* ${pkgdir}/usr/share/themes/
}
