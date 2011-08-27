# Contributor: vbPadre <vbpadre@gmail.com>

pkgname=coolreader3
pkgver=3.0.43
pkgrel=1
pkgdesc="E-book reader for Linux"
arch=('i686' 'x86_64')
url="http://coolreader.org/"
license=('gpl')
depends=('zlib' 'libpng' 'libjpeg' 'freetype2' 'qt>=4')
makedepends=('cmake')
source=('http://sourceforge.net/projects/crengine/files/CoolReader3/cr3-3.0.43/cr3_3.0.43.orig.tar.gz')
md5sums=('642be7de85591e7f9c8eb17aae46d810')

build() {

cd $srcdir/cr3-$pkgver
mkdir $srcdir/cr3-$pkgver/qtbuild
cd $srcdir/cr3-$pkgver/qtbuild
cmake -D GUI=QT -D CMAKE_BUILD_TYPE=Release  -D CMAKE_INSTALL_PREFIX=/usr ..
make
make install DESTDIR=$pkgdir 

}
