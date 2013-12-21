# Maintainer: Luke McCarthy <luke@iogopro.co.uk>

pkgname=peg
pkgver=0.1.15
pkgrel=1
pkgdesc="Tools for generating recursive-descent parsers"
arch=('i686' 'x86_64')
url="http://piumarta.com/software/peg/"
license=('MIT')
depends=('glibc')
source=(http://piumarta.com/software/peg/peg-$pkgver.tar.gz)
md5sums=('70c6638a9c98db5a57df8076897c86a9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  pwd
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install || return 1
  install -d "$pkgdir/usr/share/man/man1"
  install -m 644 src/peg.1 "$pkgdir/usr/share/man/man1"
}
