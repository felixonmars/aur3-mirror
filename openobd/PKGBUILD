# Maintainer: Simon Booth 
# Contributor: Marcin Jurczuk <marcin@jurczuk.eu>
pkgname=openobd
pkgver=0.5.0
pkgrel=1
pkgdesc="A cross platform GUI for OBD-II interface device control. "
arch=('i686' 'x86_64')
url=("http://openobd.sourceforge.net/")
license=('GPL3')
depends=('wxgtk' 'cmake')
source=("http://downloads.sourceforge.net/project/openobd/Sources/0.5.0/${pkgname}-${pkgver}.tar.gz")

md5sums=('dd8945a292ab9b4635c9e0ff9656873e')
sha512sums=('e20d61b3d3a04235f5cbe22a4f648126f85aa876b85d3299d1a7a6a9b2d78e48cab7c22b1bc5ff482c1a2c4ee6f20344043a3fc9fd4f30f66f832f75b5394869')

build()
{
 cd $srcdir/$pkgname-${pkgver//_/-} || return 1
 mkdir build
 cd build
 cmake ../
 make || return 1
 make DESTDIR=$pkgdir install || return 1
}
