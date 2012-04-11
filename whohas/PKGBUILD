# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=whohas
pkgver=0.29
pkgrel=1
pkgdesc="A tool for querying package repositories from various distros"
arch=('any')
url="http://www.philippwesche.org/200811/whohas/intro.html"
license=('GPL')
depends=('perl-libwww')
source=("${url%\/*}/$pkgname-$pkgver.tar.gz")
md5sums=('d12590e7d2c3c123b4cfb5b93ed4e902')

build() {
  return 0
}
package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bin
  install -Dm755 program/$pkgname "$pkgdir/usr/bin/$pkgname"

  # man
  install -Dm644 usr/share/man/man1/$pkgname.1 \
    "$pkgdir/usr/share/man/man1/$pkgname.1"

  # german man
  install -Dm644 usr/share/man/de/man1/$pkgname.1 \
    "$pkgdir/usr/share/man/de/man1/$pkgname.1"
}
