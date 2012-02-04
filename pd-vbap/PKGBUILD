# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=pd-vbap
pkgver=1.0.3.1
pkgrel=1
pkgdesc="A Pd port of the VBAP object for Max/MSP"
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL2')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/vbap/vbap-$pkgver.tar.gz)
md5sums=('6dec790e50cbed14c3e64c3acc3a5313')

build() {
  cd $srcdir/vbap-1.0.3.1
  make
}

package() {
  cd $srcdir/vbap-1.0.3.1
  make DESTDIR=$startdir/pkg install
}