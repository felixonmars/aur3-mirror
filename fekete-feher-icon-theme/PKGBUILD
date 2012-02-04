# Maintainer: yuginta <cowoplinplan@gmail.com>

pkgname=fekete-feher-icon-theme
pkgver=3.3
pkgrel=1
pkgdesc="Fekete icon theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Fekete?content=136768/"
license=('GPLv2')
depends=('gtk2' 'hicolor-icon-theme')
source=(http://www.deviantart.com/download/205210046/fekete_feher_by_drawerpal-d3e6d32.zip)
md5sums=('a8cbca5cfd62289a004b00fea0d7061e')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/
	cp "fekete-feher.tar.bz2" $startdir/pkg/usr/share/
	tar xf "fekete-feher.tar.bz2"
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -r "fekete-feher" $startdir/pkg/usr/share/icons/
	}
