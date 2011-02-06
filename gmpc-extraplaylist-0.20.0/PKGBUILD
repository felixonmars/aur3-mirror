# Contributor: Christian Brassat <christian AT crshd DOT cc>

pkgname=gmpc-extraplaylist-0.20.0
pkgver=0.20.0
pkgrel=3
pkgdesc="Adds a second playlist view to gmpc"
arch=("i686" "x86_64")
url="http://download.sarine.nl/Programs/gmpc/$pkgver/"
license=(unknown)
depends=("gmpc=$pkgver")
provides=(gmpc-extraplaylist)
conflicts=(gmpc-extraplaylist)
source=(http://download.sarine.nl/Programs/gmpc/$pkgver/$pkgname.tar.gz)
md5sums=(ddf19f1e831bff9e67268280d3afe107)

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

