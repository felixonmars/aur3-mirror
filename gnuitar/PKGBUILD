#Contributor: Johannes Martin <honzor@gmx.net>
pkgname=gnuitar
pkgver=0.3.2
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Guitar DSP"
url="http://sourceforge.net/projects/gnuitar"
depends=(gtk2)
source=(http://downloads.sourceforge.net/project/gnuitar/gnuitar/0.3.2/$pkgname-$pkgver.tar.gz)
md5sums=(346bc717734781280071c14e36a5a159)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
