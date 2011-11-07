# custom variables
_hkgname=rss2irc
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=rss2irc
pkgver=0.4.2
pkgrel=3
pkgdesc="watches an RSS/Atom feed and writes it to an IRC channel"
url="http://hackage.haskell.org/package/rss2irc"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-http=4000.1.1-3.1"
             "haskell-deepseq=1.1.0.2-2.1"
             "haskell-feed=0.3.8-2"
             "haskell-irc=0.4.4.2-1"
             "haskell-mtl=2.0.1.0-3.1"
             "haskell-network=2.3.0.2-2.1"
             "haskell-regexpr=0.5.4-1"
             "haskell-split=0.1.4.1-1"
             "haskell-strict-concurrency=0.2.4.1-1"
             "haskell-tagsoup=0.12.4-1")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "cabal.patch")

sha256sums=("8cb2f6ac1304895bd49fe14b9a473b0e9985dab3cec1331ea167687382167037"
            "ce619f2265e9c230d84e4846729b2f3a9601c62543f86c2005c95225494dbc5f")

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    patch rss2irc.cabal ${srcdir}/cabal.patch 

    # NP
    sed -i -e 's/Control.Parallel.Strategies/Control.DeepSeq/' rss2irc.hs

    runhaskell Setup configure -O --prefix=/usr --docdir=/usr/share/doc/${pkgname}
    runhaskell Setup build
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
