# Contributor: Lenglemetz <lenglemetz@archlinux.fr>
pkgname=tulklut
pkgver=0.2.0
pkgrel=1
pkgdesc="A system reverse language"
arch=('i686' 'x86_64')
url="http://tulklut.berlios.de/ "
license=('GPL')
depends=(ncurses)
source=(http://download.berlios.de/tulklut/$pkgname-$pkgver-pre1.tar.gz)
md5sums=('e6c3eae68e75f4f1581f69876ac00045')

build() {
  cd $startdir/src/$pkgname-$pkgver-pre1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
 
 
