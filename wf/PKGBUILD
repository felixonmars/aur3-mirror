# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=wf
pkgver=0.41
pkgrel=2
pkgdesc="Simple word frequency counter"
arch=('i686' 'x86_64')
url="http://www.async.com.br/~marcelo/wf/"
license=('GPL')
source=("http://www.async.com.br/~marcelo/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('2506603e8eafe0fab0c8e809b984d834')
sha256sums=('807d5b5d4af317c7719d73c892839a3fc9d23af1d911235328d1fa292b7f8a5a')

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
