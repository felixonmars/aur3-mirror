#Maintainer: Jarred Leonardo <jarredleonardo at googlemail dot com>

pkgname=xcursor-deepsky
pkgver=1.0
pkgrel=1
pkgdesc="DeepSky cursor theme."
arch=(i686 x86_64)
url="http://xfce-look.org/content/show.php/DeepSky?content=19555"
license=('Have Fun')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/19555-DeepSky.tar.bz2")
md5sums=('522cb1889bfc2b0d09b07ba005ecf0c6')

build() {
	cd $startdir/src/DeepSky
	install -d -m755 $startdir/pkg/usr/share/icons/deepsky/cursors
	cd $startdir/src/DeepSky/cursors
	for i in * ; do
		install -D -m644 $i $startdir/pkg/usr/share/icons/deepsky/cursors
	done
}