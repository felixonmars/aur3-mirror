#Maintainer: dongfengweixiao <dongfengweixiao at googlemail dot com>

pkgname=xcursor-thecandyman-blue
pkgver=2011.5.5
pkgrel=2
pkgdesc="TheCandyman with changed animations cursor theme."
arch=(i686 x86_64)
url=("http://gnome-look.org/content/show.php/TheCandyman+with+changed+animations?content=109907")
license=('GPL')
depends=()
source=("http://gthemes-china.googlecode.com/files/TheCandyman02.tar.gz")
md5sums=('a70dcb6c62ab20d917e2a4cae08c7b7b')

build() {
	tar zxvf TheCandyman02.tar.gz
	#cd $startdir/src/Red-Devil
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -rf TheCandyman02 $startdir/pkg/usr/share/icons/
}
