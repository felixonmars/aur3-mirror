# Contributor: Tim Schneider $MYFIRSTNAME at enveng dot de
pkgname=dxf2fig
pkgver=2.10
pkgrel=3
pkgdesc="converts dxf to fig" 
arch=('i686' 'x86_64')
license=('GPL')
url=("http://freshmeat.net/projects/dxf2fig/")
makedepends=(gcc)
source=(http://ta.twi.tudelft.nl/ftp/dv/lemmens/$pkgname-$pkgver.tar.gz)
md5sums=('b14b3893ec86c5f22b5eb180960858a0')

build() {
  cd $startdir/src/$pkgname-$pkgver/
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  install -m755 dxf2fig $startdir/pkg/usr/bin/
}

