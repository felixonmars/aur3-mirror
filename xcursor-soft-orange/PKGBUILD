#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-soft-orange
pkgver=1.0
pkgrel=1
pkgdesc="Soft-Orange cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/Soft-Orange?content=106627"
license=('Artistic 2.0')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/106627-Soft-Orange.tar.gz")
md5sums=('4a6f5d29a6f05a9780ec616da621a2f8')

build() {
	cd $startdir/src/Soft-Orange
	install -d -m755 $startdir/pkg/usr/share/icons/softorange/cursors
	cd $startdir/src/Soft-Orange/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/softorange/cursors
	done
}