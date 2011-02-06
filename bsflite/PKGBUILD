# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=bsflite
pkgver=0.85
pkgrel=1
pkgdesc="Minimalist terminal AIM-client written in C"
arch=('i686' 'x86_64')
license=('BSD')
url="http://bsflite.sourceforge.net/"
depends=(glibc)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz 
	http://downloads.sourceforge.net/$pkgname/config-example)
md5sums=('3d4bd3b438c60dad325e67d94d219faf'
         'be3b24f1e0a309498404b1430b205dc1')

build() {
  cd $srcdir/$pkgname-$pkgver
  make 
 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  
  #Install Man file to the correct directory
  sed -i 's|$(INSTALL_PREFIX)/man/man1|$(INSTALL_PREFIX)/share/man/man1|g' Makefile

  #Fix binary install issue (wants to install binary as /usr/bin instead of /usr/bin/bsflite)
  sed -i 's|$(INSTALL) -s -m 755 bsflite $(INSTALL_PREFIX)/bin|$(INSTALL) -s -m 755 bsflite $(INSTALL_PREFIX)/bin/|g' Makefile

  install -d $pkgdir/usr/{bin,share/{licenses/$pkgname,man/man1}}
  make INSTALL=/bin/install INSTALL_PREFIX=$pkgdir/usr install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
