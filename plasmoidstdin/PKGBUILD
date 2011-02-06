# Contributor: bgmiki <vmikiv@gmail.com>
pkgname=plasmoidstdin
pkgver=0.2
pkgrel=3
pkgdesc="Plasmoid Binary"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/STDIN+Plasmoid?content=92309"
license=('GPL')
source=(http://www.kde-look.org/CONTENT/content-files/92309-0.2-beta1.tar.bz2)
md5sums=('df2624396c2838457b866483dfbf9265')

build() {
	cd $startdir/src/0.2-beta1
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
