pkgname=echoping
pkgver=6.0.2
pkgrel=2
pkgdesc="echoping is a small program to test (approximatively) performances of a remote host by sending it requests such as HTTP requests."
arch=('i686' 'x86_64')
url="http://echoping.sourceforge.net/"
license=('GPL')
depends=(libidn)
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('991478532b56ab3b6f46ea9fa332626f')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --config-cache
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
