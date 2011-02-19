# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=silentjack
pkgver=0.3
pkgrel=1
pkgdesc="A silence/dead air detector for the Jack Audio Connection Kit."
arch=(i686 x86_64)
url="http://www.aelius.com/njh/silentjack/"
license=('GPL')
depends=('jack')
source=("$url$pkgname-$pkgver.tar.gz")
md5sums=('8bc921c5c4e1253a6c10f27eb2c45884')

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
