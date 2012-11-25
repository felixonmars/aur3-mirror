# Maintainer: libkenta <libkenta@gmail.com>

pkgname=whenjobs
pkgver=0.7.3
pkgrel=1
pkgdesc="Whenjobs is a powerful but simple cron replacement."
arch=('i686' 'x86_64')
url="http://people.redhat.com/~rjones/whenjobs/"
license=('GPL2' 'GPL3')
depends=('ocaml>=3.12.0' 'ocaml-findlib' 'heirloom-mailx')
makedepends=('bash' 'gcc' 'perl' 'ocaml-pcre' 'ocaml-doc' 'ocaml-calendar' 'ocamlnet');
source=(http://people.redhat.com/~rjones/whenjobs/files/$pkgname-$pkgver.tar.gz)
md5sums=('e0fe81dde02284f7e2a6da90d90def16')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
