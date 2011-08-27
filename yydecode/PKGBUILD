# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=yydecode
pkgver=0.2.10
pkgrel=2
pkgdesc="A highly portable decoder for yEnc encoded binaries "
arch=('i686' 'x86_64')
url="http://yydecode.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9e6c5eb009f9084f7cbe7e4b766b12d8') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man --bindir=/usr/bin
  
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
