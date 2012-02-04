# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=pd-boids
pkgver=1.1.1
pkgrel=1
pkgdesc="Pd externals based on Simon Fraser's implementation of Craig Reynolds' Boids algorithm."
arch=('i686' 'x86_64')
url="http://www.puredata.org/"
depends=('pd')
license=('GPL')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/boids/boids-$pkgver.tar.gz)
md5sums=('43f36f2f54b308f81e6bdd1d33944b66')

build() {
  cd $srcdir/boids-$pkgver
  make
}

build() {
  cd $srcdir/boids-$pkgver
  make DESTDIR=$startdir/pkg install
}
