# Maintainer: Magnus Therning <magnus@therning.org>

pkgname=vim-scripts-mgr
pkgver=0.3.4
pkgrel=2
pkgdesc='vim script manager'
url="http://therning.org/magnus/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-safe' 'haskell-cmdargs')
changelog=$pkgname.changelog
source=(
    http://therning.org/magnus_files/vim-scripts-mgr-${pkgver}.tar.gz
    )

build() {
    cd "$srcdir/vim-scripts-mgr-$pkgver"
    sed -i 's/0.8/0.11/' vim-scripts-mgr.cabal
    ghc --make Setup.hs

    ./Setup configure --prefix=/usr
    ./Setup build
}

package() {
    cd $srcdir/vim-scripts-mgr-$pkgver

    ./Setup copy --destdir=$pkgdir
}

sha256sums=('717497442be6c30c2aa293f9dee14860262e2e3cda716162905ab47eb9eea6aa')
