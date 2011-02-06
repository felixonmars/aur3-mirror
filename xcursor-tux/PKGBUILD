#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-tux
pkgver=0.4
pkgrel=1
pkgdesc="Tux cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/Resizeable+Tux+Cursor!?content=5376"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/5376-tuxresize.tar.gz")
md5sums=('b43b0193cca54cb6477db560110d56ef')

build() {
	cd $startdir/src/tuxcursor
	install -d -m755 $startdir/pkg/usr/share/icons/tux/cursors
	cd $startdir/src/tuxcursor/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/tux/cursors
	done
}