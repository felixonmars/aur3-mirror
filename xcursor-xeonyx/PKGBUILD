#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-xeonyx
pkgver=1.0
pkgrel=1
pkgdesc="Xeonyx cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/Xeonyx+Cursors?content=75811"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/75811-Xeonyx.tar.gz")
md5sums=('0ecb071513184a740242195260c48e7a')

build() {
	cd $startdir/src/Xeonyx
	install -d -m755 $startdir/pkg/usr/share/icons/xeonyx/cursors
	cd $startdir/src/Xeonyx/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/xeonyx/cursors
	done
}