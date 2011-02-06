# Contributor: William Rea <sillywilly@gmail.com>
pkgname=liban
pkgver=1.0
pkgrel=1
pkgdesc="A 2D scientific toolbox"
arch=('i686' 'x86_64')
url="http://lis.epfl.ch/resources/an"
license="GPL"
depends=()
source=(http://lis.epfl.ch/resources/download/liban-$pkgver.tar.gz)
md5sums=('bc301cf226a614bc91014eaab70ae652')

build() {
  cd $startdir/src/liban-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}
