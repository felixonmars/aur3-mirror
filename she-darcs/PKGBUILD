# Maintainer: Josh Kuhn <kuhn.joshua@gmail.com>

pkgname=she-darcs
pkgver=20100428
pkgrel=1
pkgdesc="A Haskell preprocessor adding miscellaneous features"
arch=('i686' 'x86_64')
url="http://personal.cis.strath.ac.uk/~conor/pub/she/"
license=('custom:PublicDomain')
makedepends=( 'ghc' 'haskell-cabal' 'haskell-filepath' 'haskell-mtl' 'darcs' )
depends=( 'gmp' )
provides=( 'she' )
conflicts=( 'she' )
options=( 'strip' )
md5sums=()
_darcstrunk="http://personal.cis.strath.ac.uk/~conor/pub"
_darcsmod="she"

build() {
    if [[ -d ${_darcsmod}/_darcs ]]
    then
        msg "Retrieving missing patches"
        cd $_darcsmod
        darcs pull -a ${url}
    else
        msg "Retrieving complete sources"
        darcs get --lazy ${url}
        cd $_darcsmod
    fi
    runhaskell Setup configure --prefix=/usr \
        --docdir=/usr/share/doc/${pkgname} || return 1
    runhaskell Setup build || return 1
    runhaskell Setup copy --destdir=${pkgdir} || return 1
    install -D -m644 LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
