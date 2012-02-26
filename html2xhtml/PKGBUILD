pkgname=html2xhtml
pkgver=1.1.2
pkgrel=2
pkgdesc="Converter from HTML to XHTML"
arch=('x86_64')
url="http://www.it.uc3m.es/jaf/html2xhtml/"
license=('GPL')
source=(http://www.it.uc3m.es/jaf/html2xhtml/downloads/$pkgname-$pkgver-$pkgrel.tar.gz)
md5sums=('44f075cafc26d34fc57f4528fed666de')

build() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
