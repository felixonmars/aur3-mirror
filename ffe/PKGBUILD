# Contributor: MeMi69 <lumpilou@gmail.com>

pkgname=ffe
pkgver=0.3.4
pkgrel=1
license=('GPL')
pkgdesc="Flat file extractor (ffe) can be used for parsing different flat file structures and printing them in different formats."
url="http://ff-extractor.sourceforge.net/"
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/ff-extractor/$pkgname-$pkgver.tar.gz)
md5sums=('e56d23e42416c763784f05dcdb5abf09')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}


package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}


