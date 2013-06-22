pdname=comport
pkgname=pd-$pdname
pkgver=0.2
pkgrel=1
pkgdesc="Pd object for reading and writing to serial ports"
arch=('i686' 'x86_64')
url="http://puredata.info/community/projects/software/comport"
license=('LGPL')
groups=('pd-externals')
depends=('pd')
source=(https://sourceforge.net/projects/pure-data/files/libraries/comport/$pdname-$pkgver.tar.gz/download)
md5sums=('50650269e3d5fc4f842a8d0934010b84')

build() {
  cd "$srcdir/$pdname-$pkgver"
  sed -i "s@/usr/local@/usr@" Makefile
  sed -i "s@/pd-externals@/pd/extra@" Makefile
  make
}

package() {
  cd "$srcdir/$pdname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
