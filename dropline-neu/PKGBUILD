# Maintainer: Sebastian Lenz <sebastian@archusers.de>
pkgname=dropline-neu
_packedname=Neu
pkgver=1
pkgrel=1
pkgdesc="Dropline Neu! Icon Theme"
arch=('i686' 'x86_64')
url="http://art.gnome.org/themes/icon"
license=('GPL2')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=(http://art.gnome.org/download/themes/icon/1100/ICON-DroplineNeu.tar.bz2)
md5sums=('4a824b048cddaa428021681e7480e3c2')

build() {
	cd $srcdir/${_packedname}/
	mkdir -p ${pkgdir}/usr/share/icons/dropline-neu/{22x22,48x48,128x128}/{actions,apps,categories,devices,emblems,mimetypes,places,status}/SVGs
	mkdir -p ${pkgdir}/usr/share/icons/dropline-neu/{24x24,scalable}/{actions,apps,categories,devices,emblems,mimetypes,places,status}
	
	install AUTHORS ${pkgdir}/usr/share/icons/dropline-neu/
	install COPYING ${pkgdir}/usr/share/icons/dropline-neu/
	install index.theme ${pkgdir}/usr/share/icons/dropline-neu/
	
	install -D 22x22/actions/SVGs/*.svg ${pkgdir}/usr/share/icons/dropline-neu/22x22/actions/SVGs/
	install -D 22x22/actions/*.png ${pkgdir}/usr/share/icons/dropline-neu/22x22/actions/
	install -D 22x22/apps/*.png ${pkgdir}/usr/share/icons/dropline-neu/22x22/apps/
	install -D 22x22/apps/SVGs/*.svg ${pkgdir}/usr/share/icons/dropline-neu/22x22/apps/SVGs/
	install -D 22x22/categories/*.png ${pkgdir}/usr/share/icons/dropline-neu/22x22/categories/
	install -D 22x22/categories/SVGs/*.svg ${pkgdir}/usr/share/icons/dropline-neu/22x22/categories/SVGs/
	install -D 22x22/devices/*.png ${pkgdir}/usr/share/icons/dropline-neu/22x22/devices/
	install -D 22x22/devices/SVGs/*.svg ${pkgdir}/usr/share/icons/dropline-neu/22x22/devices/SVGs/
	install -D 22x22/emblems/*.png ${pkgdir}/usr/share/icons/dropline-neu/22x22/emblems/
	install -D 22x22/emblems/SVGs/*.svg ${pkgdir}/usr/share/icons/dropline-neu/22x22/emblems/SVGs/
	install -D 22x22/mimetypes/*.png ${pkgdir}/usr/share/icons/dropline-neu/22x22/mimetypes/
	install -D 22x22/mimetypes/SVGs/*.svg ${pkgdir}/usr/share/icons/dropline-neu/22x22/mimetypes/SVGs/
	install -D 22x22/places/*.png ${pkgdir}/usr/share/icons/dropline-neu/22x22/places/
	install -D 22x22/places/SVGs/*.svg ${pkgdir}/usr/share/icons/dropline-neu/22x22/places/SVGs/
	install -D 22x22/status/*.png ${pkgdir}/usr/share/icons/dropline-neu/22x22/status/
	install -D 22x22/status/SVGs/*.svg ${pkgdir}/usr/share/icons/dropline-neu/22x22/status/SVGs/

	install -D 24x24/actions/*.png ${pkgdir}/usr/share/icons/dropline-neu/24x24/actions/
	install -D 24x24/apps/*.png ${pkgdir}/usr/share/icons/dropline-neu/24x24/apps/
	install -D 24x24/categories/*.png ${pkgdir}/usr/share/icons/dropline-neu/24x24/categories/
	install -D 24x24/devices/*.png ${pkgdir}/usr/share/icons/dropline-neu/24x24/devices/
	#install -D 24x24/emblems/*.png ${pkgdir}/usr/share/icons/dropline-neu/24x24/emblems/
	install -D 24x24/mimetypes/*.png ${pkgdir}/usr/share/icons/dropline-neu/24x24/mimetypes/
	install -D 24x24/places/*.png ${pkgdir}/usr/share/icons/dropline-neu/24x24/places/
	install -D 24x24/status/*.png ${pkgdir}/usr/share/icons/dropline-neu/24x24/status/
	
	install -D 48x48/actions/*.png ${pkgdir}/usr/share/icons/dropline-neu/48x48/actions/
	install -D 48x48/apps/*.png ${pkgdir}/usr/share/icons/dropline-neu/48x48/apps/
	install -D 48x48/categories/*.png ${pkgdir}/usr/share/icons/dropline-neu/48x48/categories/
	install -D 48x48/devices/*.png ${pkgdir}/usr/share/icons/dropline-neu/48x48/devices/
	install -D 48x48/emblems/*.png ${pkgdir}/usr/share/icons/dropline-neu/48x48/emblems/
	install -D 48x48/mimetypes/*.png ${pkgdir}/usr/share/icons/dropline-neu/48x48/mimetypes/
	install -D 48x48/places/*.png ${pkgdir}/usr/share/icons/dropline-neu/48x48/places/
	install -D 48x48/status/*.png ${pkgdir}/usr/share/icons/dropline-neu/48x48/status/
	
	install -D 128x128/actions/*.png ${pkgdir}/usr/share/icons/dropline-neu/128x128/actions/
	install -D 128x128/apps/*.png ${pkgdir}/usr/share/icons/dropline-neu/128x128/apps/
	install -D 128x128/categories/*.png ${pkgdir}/usr/share/icons/dropline-neu/128x128/categories/
	install -D 128x128/devices/*.png ${pkgdir}/usr/share/icons/dropline-neu/128x128/devices/
	install -D 128x128/emblems/*.png ${pkgdir}/usr/share/icons/dropline-neu/128x128/emblems/
	install -D 128x128/mimetypes/*.png ${pkgdir}/usr/share/icons/dropline-neu/128x128/mimetypes/
	install -D 128x128/places/*.png ${pkgdir}/usr/share/icons/dropline-neu/128x128/places/
	install -D 128x128/status/*.png ${pkgdir}/usr/share/icons/dropline-neu/128x128/status/
	
	install -D scalable/actions/*.svg ${pkgdir}/usr/share/icons/dropline-neu/scalable/actions/
	install -D scalable/apps/*.svg ${pkgdir}/usr/share/icons/dropline-neu/scalable/apps/
	install -D scalable/categories/*.svg ${pkgdir}/usr/share/icons/dropline-neu/scalable/categories/
	install -D scalable/devices/*.svg ${pkgdir}/usr/share/icons/dropline-neu/scalable/devices/
	install -D scalable/emblems/*.svg ${pkgdir}/usr/share/icons/dropline-neu/scalable/emblems/
	install -D scalable/mimetypes/*.svg ${pkgdir}/usr/share/icons/dropline-neu/scalable/mimetypes/
	install -D scalable/places/*.svg ${pkgdir}/usr/share/icons/dropline-neu/scalable/places/
	install -D scalable/status/*.svg ${pkgdir}/usr/share/icons/dropline-neu/scalable/status/
}
