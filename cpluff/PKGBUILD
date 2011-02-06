# $Id$
# Maintainer: Sebastien Binet <binet@cern.ch>

pkgname=cpluff
pkgver=0.1.3
pkgrel=1
pkgdesc="C-Pluff, a plug-in framework for C"
arch=(i686 x86_64)
url="http://www.c-pluff.org"
license=('custom:MIT')

depends=('expat')
source=(http://www.c-pluff.org/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('470cb5023e4f2d53b09d05e6540dcb7d')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=$startdir/pkg install
}
