# Maintainer: yuginta <cowoplinplan@gmail.com>

pkgname=idea-icon-theme
pkgver=1.0
pkgrel=1
pkgdesc="Idea icon theme"
arch=('any')
url="http://gnome-look.org/content/download.php?content=143998"
license=('GPL')
depends=('gtk2' 'hicolor-icon-theme')
source=(http://dl.dropbox.com/u/4995559/idea.tar.gz)
md5sums=('9a734132521e668eb1b1db894f3b13b6')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -r "idea" $startdir/pkg/usr/share/icons/
}
