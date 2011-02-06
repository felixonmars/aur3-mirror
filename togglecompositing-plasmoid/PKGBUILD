# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=togglecompositing-plasmoid
pkgver=0.2.3
pkgrel=1
pkgdesc="A convenient plasmoid that allows you to toggle between kwin's compositing and traditional modes."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Toggle-Compositing?content=78299"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'gcc' 'automoc4')
source=(http://ivplasma.googlecode.com/files/toggle-compositing-$pkgver.tar.gz)
md5sums=('c811dd4d9842d1628b748e01855357b5')

build() {

cd $startdir/src/toggle-compositing
mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$startdir/pkg install || return 1

}
