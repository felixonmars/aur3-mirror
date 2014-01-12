# Contributor: Javier ‘Phrodo_00’ Aravena <Phrodo.00@gmail.com>
pkgname=gmysqlcc
pkgver=0.3.0
pkgrel=2
pkgdesc="GUI client for mysql databases."
arch=('i686' 'x86_64')
url="http://www.thepozer.com/projet-gmysqlcc/"
license=('GPL')
depends=('gtk2' 'gtksourceview2' 'libmysqlclient')
source=("http://fossies.org/unix/privat/$pkgname-$pkgver.tar.gz")
md5sums=('cdfd5f1e4da8bbde45a52ba6a02f8313')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --with-gtksourceview --prefix=/usr
  make || return 1
}
package() {
  cd $startdir/src/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
