#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-blackwidow
pkgver=1.0
pkgrel=1
pkgdesc="BlackWidow cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/BlackWidow?content=108486"
license=('Artistic 2.0')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/108486-BlackWidow.tar.gz")
md5sums=('e94c45498d8ef8114a6a5af612cd5965')

build() {
	cd $startdir/src/BlackWidow
	install -d -m755 $startdir/pkg/usr/share/icons/blackwidow/cursors
	cd $startdir/src/BlackWidow/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/blackwidow/cursors
	done
}