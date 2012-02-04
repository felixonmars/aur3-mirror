# Contributor: Rasi <rasi13@gmx.de>
pkgname=plasmoid-windowlist
pkgrealname=windowlist
pkgver=3.1
pkgrel=1
pkgdesc="little plasmoid that shows a popup list of open windows"
arch=("i686" "x86_64")
url="http://kde-look.org/content/show.php/Window+List?content=96486"
license=("GPL")
depends=("kdebase-workspace")
optdepends=()
makedepends=("cmake" "automoc4")
provides=()
conflicts=()
source=(http://kde-look.org/CONTENT/content-files/96486-$pkgrealname-$pkgver.tar.bz2)

build() {
	cd $srcdir/windowlist-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make || return 1
	make DESTDIR=$pkgdir install
}
md5sums=('ec614368f9a04f989640634f48d96162')
