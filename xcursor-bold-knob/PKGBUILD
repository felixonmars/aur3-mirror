#Maintainer: dongfengweixiao <dongfengweixiao at googlemail dot com>

pkgname=xcursor-bold-knob
pkgver=2011.11.2
pkgrel=2
pkgdesc="Bold-Knob cursor theme."
arch=(i686 x86_64)
url=("http://gnome-look.org/content/show.php/Bold-Knob?content=147310")
license=('GPL')
depends=()
source=("http://gthemes-china.googlecode.com/files/bold_knob_by_grynays-d4hyjjl.zip")
md5sums=('b1269cc5a282b793f3dfea66d48df9cb')

build() {
	tar zxvf Bold-Knob.tar.gz
	#cd $startdir/src/Red-Devil
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -rf Bold-Knob $startdir/pkg/usr/share/icons/
}
#http://grynays.deviantart.com/#/d4hyjjl
