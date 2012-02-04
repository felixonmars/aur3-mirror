# Contributor: Henri Häkkinen <henuxd@gmail.com>

pkgname=libasn
pkgver=0.6
pkgrel=3
pkgdesc="General purpose library implementing very useful functionality in C."
arch=('i686' 'x86_64')
url="http://labs.asn.pl/asnlibs/wiki/libasn"
license=('GPL')
provides=('libasn')
source=(http://download.asn.pl/asnlibs/$pkgname-$pkgver.tar.gz)
md5sums=('3f972e9d9088b61eb68831565eb45ca1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
  make DESTDIR="$pkgdir/" install

  # Remove the example program.
  rm "$pkgdir/usr/bin/libasn_example"
}

# vim:set ts=2 sw=2 et:
