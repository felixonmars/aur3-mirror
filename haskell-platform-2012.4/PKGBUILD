# Maintainer: j.lahav at gmail dot com
# Contributor: a.c.kalker at gmail dot com
pkgname=haskell-platform-2012.4
#custom variables
_pkgname=haskell-platform
_ghcver=7.4.2
pkgver=2012.4.0.0
pkgrel=1
pkgdesc="Haskell: batteries included."
arch=('i686' 'x86_64')
url="http://haskell.org"
license="BSD3"
depends=("ghc-$_ghcver")
makedepends=('haskell-hscolour')
provides=($_pkgname 'cabal-install')
conflicts=($_pkgname 'cabal-install')
install=$pkgname.install
source="http://lambda.haskell.org/platform/download/$pkgver/haskell-platform-$pkgver.tar.gz"
sha1sums=('7976508c50305969f64c721a1d095ae22efff8b7')
function build {
	cd $srcdir/$_pkgname-$pkgver
	mkdir $pkgdir/usr
	mkdir -p $pkgdir/usr/lib/ghc-$_ghcver/package.conf.d
	# --enable-shared causes namcap error 'E: Insecure RPATH'. Leave out for now.
	./configure --prefix="/usr"
	make
}
function package {
	cd $srcdir/$_pkgname-$pkgver
	scripts/package.sh $pkgdir $pkgdir/usr/lib/ghc-$_ghcver/package.conf.d
}
