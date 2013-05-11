# Maintainer: eagletmt <eagletmt@gmail.com>
# Contributor: kusanaginoturugi <kusanaginoturugi@gmail.com>
pkgname=libskk
pkgver=1.0.1
pkgrel=1
pkgdesc='GObject-based library to deal with Japanese kana-to-kanji conversion method'
arch=('i686' 'x86_64')
url='https://github.com/ueno/libskk'
license=('GPL3')
depends=('libgee06' 'json-glib')
makedepends=('pkg-config' 'intltool')
source=(https://bitbucket.org/$pkgname/$pkgname/downloads/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('2052bfa898205b641bb2cc448516230f')
