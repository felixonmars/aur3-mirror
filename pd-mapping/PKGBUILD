# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=pd-mapping
pkgver=0.2
pkgrel=1
pkgdesc="External for PureData"
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/mapping/mapping-$pkgver.tar.gz)
md5sums=('9f599f8e5025599f3d01f4365cd8807f')

build() {
  cd ${srcdir}/mapping-$pkgver
  make
}

package() {
  cd ${srcdir}/mapping-$pkgver
  make DESTDIR=$startdir/pkg install
}

