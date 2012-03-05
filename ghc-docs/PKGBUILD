#maintainer: Jáchym Barvínek <jachymb@gmail.com>

pkgname=ghc-docs
pkgver=7.4.1
pkgrel=1
pkgdesc="Documents for the Glasgow Haskell Compiler"
arch=(any)
url="http://haskell.org/haskellwiki/GHC"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
source=(index.html
        http://www.haskell.org/ghc/docs/7.0.4/Cabal.html.tar.bz2
        http://www.haskell.org/ghc/docs/$pkgver/libraries.html.tar.bz2
        http://www.haskell.org/ghc/docs/$pkgver/users_guide.html.tar.bz2
		http://www.haskell.org/ghc/docs/$pkgver/haddock.html.tar.bz2
        )

md5sums=('a92ae33653c613fae38c9c08195c9425'
         '150459b9363fb127140f4b4f55c0a838'
         'c73cf61dac1448a058dfaa1fc194a538'
	     'f2225b3892f07698c93842544b60b044'
         '3790e96cba7c23d8de0e851e89a03331')

noextract=()

package() {
      cd $srcdir
      install -Dm 644 $srcdir/index.html $pkgdir/usr/share/doc/ghc/index.html || return 1
      mv $srcdir/Cabal $pkgdir/usr/share/doc/ghc/ || return 1
      mv $srcdir/users_guide $pkgdir/usr/share/doc/ghc/ || return 1
      mv $srcdir/libraries $pkgdir/usr/share/doc/ghc/ || return 1
      mv $srcdir/haddock $pkgdir/usr/share/doc/ghc/ || return 1
}
