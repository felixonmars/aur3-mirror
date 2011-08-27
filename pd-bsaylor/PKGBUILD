# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=pd-bsaylor
pkgver=0.1
pkgrel=1
pkgdesc="Pd externals"
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/bsaylor/bsaylor-$pkgver.tar.gz)
md5sums=('a6f7498da93c0dbaf170c8e975e647cd')


build() {
  cd $srcdir/bsaylor-$pkgver
  make
  make DESTDIR=$startdir/pkg install
}
