# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=miau
pkgver=0.6.6
pkgrel=1
pkgdesc="An IRC bouncer/proxy"
arch=(i686 x86_64)
url="http://miau.sourceforge.net/"
license=('GPL')
depends=('sh')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('8778b8564c679cf5487b1972ca0b35e4')
 
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
