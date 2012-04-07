# Contributor: fuzzix@gmail.com
pkgname=testbit-tools
pkgver=11.09.0
pkgrel=3
pkgdesc="Tools that have been found useful during the development of several Testbit.eu projects"
arch=('i686' 'x86_64')
url="http://testbit.eu/Tools"
license=('GPL3')
depends=('python2')
source=(http://dist.testbit.eu/$pkgname/$pkgname-$pkgver.tar.bz2 wikihtml2man.patch)
md5sums=('458ff6782411d3da7dc31dfe3bd18973' '8dc09fbdc3179b9ed58d2d4067b9fe3b')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --prefix=/usr
  make
  cd "$srcdir/"
  patch -p1 < ../wikihtml2man.patch
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}


