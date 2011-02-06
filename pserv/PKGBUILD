# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=pserv
pkgver=3.4
pkgrel=1
pkgdesc="A small web server. It is meant to be portable and configurable."
arch=('i686' 'x86_64')
url="http://pserv.sourceforge.net/"
license=('GPL2')
depends=('glibc')
source=("http://downloads.sourceforge.net/pserv/$pkgname-$pkgver.tar.Z")
md5sums=('65c31088ac3ac74fc1986b4de04c1391')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  ./configure --prefix=/usr --bindir=/usr/bin  --sysconfdir=/etc --localstatedir=/var/lib
  
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make  DESTDIR=$pkgdir install
}
