#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-redsplinter
pkgver=2.0
pkgrel=1
pkgdesc="RedSplinter cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/RedSplinter?content=106618"
license=('Artistic 2.0')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/106618-RedSplinter.tar.gz")
md5sums=('39deed62cddc863aa5a3e4a870c0a497')

build() {
	cd $startdir/src/RedSplinter
	install -d -m755 $startdir/pkg/usr/share/icons/redsplinter/cursors
	cd $startdir/src/RedSplinter/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/redsplinter/cursors
	done
}