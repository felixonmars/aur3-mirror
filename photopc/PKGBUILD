# Contributor: Ruben Schuller <r.schuller@orgizm.net>
arch=('i686' 'x86_64')
pkgname=photopc
pkgver=3.07
pkgrel=1
pkgdesc="program to download pictures from some old digital cameras with serial port link"
source=("http://downloads.sourceforge.net/project/photopc/photopc/3.07/photopc-$pkgver.tar.gz")
url="http://photopc.sourceforge.net/"
license="Public Domain"
md5sums=('f60bdc1a4866d3840abeaa16a2c5f10e')
build() {

  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$startdir/pkg install  

}
