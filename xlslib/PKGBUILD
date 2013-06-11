# Maintainer: Artyom Olshevskiy <siasiamail@gmail.com>
pkgname=xlslib  
pkgver=2.4.0
pkgrel=1 
pkgdesc="A C/C++ multi-platform library for dynamically generating Excel(TM) files"
url="http://xlslib.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=($pkgname-package-$pkgver.zip::http://sourceforge.net/projects/$pkgname/files/$pkgname-package-$pkgver.zip/download)
md5sums=('5ff9eeee473331ab6cf59850a017ed74')
build() {
  cd $srcdir/$pkgname/$pkgname
  LIBS=-lstdc++ ./configure --prefix=/usr
  make
}
package() {
	cd $srcdir/$pkgname/$pkgname
  make DESTDIR=$pkgdir install
}
