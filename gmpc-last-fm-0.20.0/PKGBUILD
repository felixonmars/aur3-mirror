# Contributor: Christian Brassat <christian AT crshd DOT cc>

pkgname=gmpc-last-fm-0.20.0
pkgver=0.20.0
pkgrel=2
pkgdesc="Plugin to fetch Album and Artist art from last.fm for gmpc"
arch=("i686" "x86_64")
url="http://download.sarine.nl/Programs/gmpc/$pkgver/"
license=(unknown)
depends=("gmpc=$pkgver")
provides=(gmpc-last-fm)
conflicts=(gmpc-last-fm)
source=(http://download.sarine.nl/Programs/gmpc/$pkgver/$pkgname.tar.gz)
md5sums=(aa5ae094e1bb78a11de9dd6e12f0bfb7)

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

