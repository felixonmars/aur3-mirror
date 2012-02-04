# Contributor: Sebastien Piccand <sebcactus gmail com>
pkgname=libge
pkgver=0.26
pkgrel=5
pkgdesc="libGE is a C++ library that implements the Grammatical Evolution mapping process"
arch=('i686')
url="http://bds.ul.ie/libGE/"
license=('GPL')
source=(http://bds.ul.ie/libGE/libGE-$pkgver.tar.gz)
md5sums=('fc0dad910a21ead3e738349f7c4c92cb')

build() {
  cd $startdir/src/libGE-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
