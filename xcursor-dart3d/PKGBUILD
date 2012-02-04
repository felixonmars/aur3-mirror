#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-dart3d
pkgver=1.0
pkgrel=1
pkgdesc="Dart3D cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/Dart3D?content=88322"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/88322-Dart3D_LHPPL.tar.gz")
md5sums=('d65dbf7101ef6679f5d3fe91def5cd9f')

build() {
	cd $startdir/src/Dart3D_LHPPL
	install -d -m755 $startdir/pkg/usr/share/icons/dart3d/cursors
	cd $startdir/src/Dart3D_LHPPL/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/dart3d/cursors
	done
}