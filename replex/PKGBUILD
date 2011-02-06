# Contributer: Sebastian Sareyko <public@nooms.de>
# Contributer: Ermanno <erm67@yahoo.it>

pkgname=replex
pkgver=0.1.6.8
pkgrel=2
pkgdesc="Remultiplex an MPEG2 TS into a PS for DVD"
url="http://www.metzlerbros.org/dvb/index.html"
depends=()
arch=('i686' 'x86_64')
license=('GPL')
source=(http://www.metzlerbros.org/dvb/$pkgname-$pkgver.tar.gz)
md5sums=('de02c1b55bc7863f811adffe611f1c71')

build() {
  cd $startdir/src/$pkgname-$pkgver

  mkdir -p $startdir/pkg/{bin,lib}

  /usr/bin/make _FILE_OFFSET_BITS=64 _LARGEFILE_SOURCE=1 _LARGEFILE64_SOURCE=1|| return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
}
