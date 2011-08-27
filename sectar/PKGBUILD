# Contributor: Nathan Owe <ndowens.aur @ gmail.com>
pkgname=sectar
pkgver=1.02
pkgrel=2
pkgdesc="A program that creates encrypted tape archives(tar files)"
arch=('i686') 
url="http://sectar.sourceforge.net"
license=('GPL2')
depends=('glibc')
options=('!libtool')
source=(http://downloads.sourceforge.net/star/$pkgname-$pkgver.tar.gz)
md5sums=('2882836c159ab2960064e591668ed658') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  
  make DESTDIR=$pkgdir install
}
