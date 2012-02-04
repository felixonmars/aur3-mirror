# Contributor: Laurent Almeras <laurent.almeras@gmail.com>

pkgname=smartdimmer
pkgver=0.1
pkgrel=1
pkgdesc="LCD brightness tool for NVidia cards with SmartDimmer feature"
arch=('i686' 'x86_64')
url="http://paketler.pardus.org.tr/2007/source/smartdimmer.html"
license=('GPL')
depends=()
makedepends=()
source=(http://www.acc.umu.se/~erikw/program/$pkgname-$pkgver.tar.bz2)
md5sums=('4f5f608e27ac1df5983a6adeaa641fca')

build() {
	  cd $startdir/src/$pkgname
	  mkdir -p $startdir/pkg/usr/bin
	  ./configure --prefix=$startdir/pkg/usr || return 1

	  make || return 1
          make install || return 1
}
