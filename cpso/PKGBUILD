# Contributor: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=cpso
pkgver=0.1.0
pkgrel=1
pkgdesc="Particle swarm optimization library"
arch=('i686' 'x86_64')
url="http://oproj.tuxfamily.org" 
depends=('glibc')
makedepends=('gcc')
license=(LGPL)
source=("http://downloads.tuxfamily.org/oproj/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=("dcdb1411169843464a63c0ff51451368")

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  make
  mkdir -p ${startdir}/pkg/usr/{lib,include}
  make install DESTDIR=${startdir}/pkg/usr
}
