# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=rotter
pkgver=0.9
pkgrel=1
pkgdesc="A Recording of Transmission / Audio Logger for JACK."
arch=(i686 x86_64)
url="http://www.aelius.com/njh/rotter/"
license=('GPL')
depends=('jack' 'lame')
source=("$url$pkgname-$pkgver.tar.gz")
md5sums=('883cc4b102caa266cc80681ba54b3c06')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
