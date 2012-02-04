# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=pd-creb
pkgver=0.9.0
pkgrel=1
pkgdesc="Pd externals based on Simon Fraser's implementation of Craig Reynolds' Boids algorithm."
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/creb/creb-$pkgver.tar.gz)
md5sums=('7479cef0c3314d12231dafd88b398bc4')


build() {
  cd $srcdir/creb-$pkgver
  ./configure --prefix=/usr
  make
}
