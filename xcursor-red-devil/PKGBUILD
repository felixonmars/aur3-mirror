#Maintainer: dongfengweixiao <dongfengweixiao at googlemail dot com>

pkgname=xcursor-red-devil
pkgver=2011.11.02
pkgrel=2
pkgdesc="Red-Devil cursor theme."
arch=(i686 x86_64)
url=("http://gnome-look.org/content/show.php/Red-Devil?content=147312")
license=('GPL')
depends=()
source=("http://gthemes-china.googlecode.com/files/red_devil_by_grynays-d4hyis2.zip")
md5sums=('581e1a1fc318b07d4bda78cd7288061c')

build() {
	tar zxvf Red-Devil.tar.gz
	#cd $startdir/src/Red-Devil
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -rf Red-Devil $startdir/pkg/usr/share/icons/
}
