# Maintainer: Ben Morgan <neembi@googlemail.com>
pkgname=is-net
pkgver=0.10.1
pkgrel=2
pkgdesc="Several programs providing action execution based on network connectivity"
license=('MIT')
arch=('i686' 'x86_64')
url="https://github.com/cassava/is-net"
makedepends=('ghc' 'haskell-haskell98=1.1.0.1' 'haskell-process=1.0.1.5' 'haskell-unix=2.4.2.0')
depends=(gmp ifplugd)
source=(https://github.com/downloads/cassava/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  runhaskell Setup.lhs configure -O --prefix=/usr --datadir=/usr/share/doc --datasubdir=$pkgname --docdir=/usr/share/licenses/$pkgname
  runhaskell Setup build
}

package() {
  cd $srcdir/$pkgname-$pkgver

  # Install files
  runhaskell Setup copy --destdir=$pkgdir

  # Adjust a few things
  cd $pkgdir/usr/share/doc/$pkgname
  mv doc/examples/* ./
  rm -r doc
}

md5sums=('490606275cf0cd71d6bf1f33a18c5336')
