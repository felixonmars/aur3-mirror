# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>

pkgname=revdectime
pkgver=0.1.1
pkgrel=1
pkgdesc="A French revolutionary decimal time (metric) clock."
url="http://hackage.haskell.org/package/$pkgname-$pkgver"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('ghc')
provides=('revdectime')
conflicts=()
replaces=()
source=("http://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('b11cec496d7d5b5e761c3222359951f1')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	runhaskell Setup.hs configure --prefix=/usr -O
	runhaskell Setup.hs build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	runhaskell Setup.hs copy --destdir=${pkgdir}
	install -D -m644 src/revdectime.1 "$pkgdir/usr/share/man/man1/revdectime.1"
}
