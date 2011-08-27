# Maintainer: yuginta <cowoplinplan@gmail.com>

pkgname=fekete-icon-theme
pkgver=3.3
pkgrel=1
pkgdesc="Fekete icon theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Fekete?content=136768/"
license=('GPLv2')
depends=('gtk2' 'hicolor-icon-theme')
source=(http://www.deviantart.com/download/191332140/fekete_by_drawerpal-d35wwto.zip)
md5sums=('ddab79da152ef3b101edf7e13c2bc884')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/
	cp "Fekete.tar.bz2" $startdir/pkg/usr/share/
	tar xf "Fekete.tar.bz2"
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -r "Fekete" $startdir/pkg/usr/share/icons/
	}
