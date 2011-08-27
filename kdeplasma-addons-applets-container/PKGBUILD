# Maintainer: Juan Diego Tascon

pkgname=kdeplasma-addons-applets-container
pkgver=0.1
pkgrel=1
pkgdesc="This plasmoids lets you group other plasmoids."
url="http://www.kde-look.org/content/show.php/Container?content=112094"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4')

source=("http://www.kde-look.org/CONTENT/content-files/112094-container-${pkgver}.tar.bz2")

md5sums=('08302f6b0007beaa65fb73b83481396c')

build() {
	cd $srcdir/container
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}
