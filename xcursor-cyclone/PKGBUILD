#Maintainer: dongfengweixiao <dongfengweixiao at googlemail dot com>

pkgname=xcursor-cyclone
pkgver=2011.11.2
pkgrel=1
pkgdesc="Cyclone cursor theme."
arch=(i686 x86_64)
url=("http://gnome-look.org/content/show.php/Cyclone?content=147311")
license=('GPL')
depends=()
source=("http://gthemes-china.googlecode.com/files/cyclone_by_grynays-d4hyk0m.zip")
md5sums=('f62e8ce7822b48eb47ef669b3d2ece1b')

build() {
	tar zxvf Cyclone.tar.gz
	#cd $startdir/src/Red-Devil
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -rf Cyclone $startdir/pkg/usr/share/icons/
}
