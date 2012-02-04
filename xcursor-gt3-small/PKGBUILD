#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-gt3-small
pkgver=1.0
pkgrel=1
pkgdesc="A small version of the GT3 cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/GT3?content=106536"
license=('Artistic 2.0')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/106536-GT3cursors.zip")
md5sums=('7f110ad2b710ba91ce306fef4407f2c8')

build() {
	cd $startdir/src/GT3cursors
	install -d -m755 $startdir/pkg/usr/share/icons/GT3-small/cursors
	tar xf GT3-small.tar.gz
	cd $startdir/src/GT3cursors/GT3-small/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/GT3-small/cursors
	done
}