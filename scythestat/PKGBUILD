# Maintainer:  <ying@althonx4>
pkgname=scythestat  
pkgver=1.0.3
pkgrel=2 
pkgdesc="The Scythe Statistical Library is an open source C++ library for statistical computation"
url="http://scythe.wustl.edu/"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
source=(http://scythe.wustl.edu/files/${pkgname}-$pkgver.tar.gz)


build() {
  cd $startdir/src/${pkgname}-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $startdir/src/${pkgname}-$pkgver
  make DESTDIR=$startdir/pkg install
}
md5sums=('243af20bce228220838ce30bc55445c5')
