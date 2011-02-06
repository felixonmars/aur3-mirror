#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-blueillusion
pkgver=2.0
pkgrel=1
pkgdesc="BlueIllusion cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/BlueIllusion+2?content=88323"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/88323-BlueIllusion2.tar.gz")
md5sums=('8ce35836f5e4d3947e1033ad4417e4ca')

build() {
	cd $startdir/src/BlueIllusion2
	install -d -m755 $startdir/pkg/usr/share/icons/blueillusion/cursors
	cd $startdir/src/BlueIllusion2/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/blueillusion/cursors
	done
}