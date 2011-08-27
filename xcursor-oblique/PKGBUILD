#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-oblique
pkgver=1.0
pkgrel=1
pkgdesc="Oblique cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/Oblique?content=106582"
license=('Artistic 2.0')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/106582-Oblique.tar.gz")
md5sums=('aa30d270b5417a01e39c0217848a74d2')

build() {
	cd $startdir/src/Oblique
	install -d -m755 $startdir/pkg/usr/share/icons/oblique/cursors
	cd $startdir/src/Oblique/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/oblique/cursors
	done
}