#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>
#Maintainer: GreenRaccoon23 <jarredleonardo at googlemail dot com>

pkgname=xcursor-chrome-glass
pkgver=1.0
pkgrel=2
pkgdesc="Chrome glass cursor theme."
arch=(any)
url="http://xfce-look.org/content/show.php/Chrome+Glass?content=88321"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/88321-CG.tar.gz")
md5sums=('ce4a097c2e9d47d0f1529719effd89c0')

build() {
	cd $startdir/src/CG
	install -d -m755 $startdir/pkg/usr/share/icons/chromeglass/cursors
	cd $startdir/src/CG/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/chromeglass/cursors
	done
}
