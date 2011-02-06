# Contributor: Henri Häkkinen <henuxd@gmail.com>

pkgname=libkinput
pkgver=0.6.2
pkgrel=2
pkgdesc="Lightweight readline replacement library."
arch=('i686' 'x86_64')
url="http://labs.asn.pl/asnlibs/wiki/libkinput"
license=('GPL')
provides=('libkinput')
depends=('libasn')
source=(http://download.asn.pl/asnlibs/$pkgname-$pkgver.tar.gz)
md5sums=('c97d9a6f912df2bd0a536fe825df10af')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
  make DESTDIR="$pkgdir/" install

  # Remove the example program.
  rm "$pkgdir/usr/bin/kinput_example"
}

# vim:set ts=2 sw=2 et:
