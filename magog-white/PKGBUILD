# Maintainer: Josip <josipponjavic@gmail.com>

pkgname=magog-white
pkgver=11
pkgrel=1
pkgdesc="GNOME Icon Theme - for darker themes..."
arch=('any')
url="http://www.gnome-look.org/content/show.php/Magog+White?content=113785"
license=('GPL')
source=(http://dl.dropbox.com/u/320187/Magog%20White.tar.gz)
md5sums=('f87db97a1312c072271a89090236a12b')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -r "Magog White" $startdir/pkg/usr/share/icons/
}

