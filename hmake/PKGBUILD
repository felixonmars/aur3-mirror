# Contributor: Adam Vogt <vogt.adam@gmail.com>
pkgname=hmake
pkgver=3.14
pkgrel=2
pkgdesc="a compilation manager for Haskell programs"
arch=('x86_64')
url="http://darcs.haskell.org/nhc98/docs/hmake/"
license=('GPL')
makedepends=('GHC')
install=
source=(http://www.cs.york.ac.uk/fp/hmake/hmake-$pkgver.tar.gz)
md5sums=('7fb58d8e5c257869200d87cff19d7b15')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
