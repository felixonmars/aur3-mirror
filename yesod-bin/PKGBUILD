# custom variables
_hkgname=yesod-bin
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=yesod-bin
pkgver=1.4.3.4
pkgrel=1
pkgdesc="The yesod helper executable."
url="http://www.yesodweb.com/"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=("ghc=7.8.4-1"
             "haskell-attoparsec=0.12.1.2-4"
             "haskell-base64-bytestring=1.0.0.1-57"
             "haskell-blaze-builder=0.3.3.4-4"
             "haskell-conduit=1.2.3.1-4"
             "haskell-conduit-extra=1.1.6.2-1"
             "haskell-data-default-class=0.0.1-57"
             "haskell-file-embed=0.0.7.1-1"
             "haskell-fsnotify=0.1.0.3-3"
             "haskell-ghc-paths=0.1.0.9-57"
             "haskell-http-conduit=2.1.5-10"
             "haskell-http-reverse-proxy=0.4.1.2-3"
             "haskell-http-types=0.8.5-11"
             "haskell-lifted-base=0.2.3.3-4"
             "haskell-network=2.6.0.2-2"
             "haskell-optparse-applicative=0.11.0.1-3"
             "haskell-parsec=3.1.8-1"
             "haskell-project-template=0.1.4.2-3"
             "haskell-resourcet=1.1.3.3-4"
             "haskell-shakespeare=2.0.2.2-1"
             "haskell-split=0.2.2-58"
             "haskell-streaming-commons=0.1.8.1-1"
             "haskell-system-fileio=0.3.16-4"
             "haskell-system-filepath=0.4.13.1-1"
             "haskell-tar=0.4.0.1-58"
             "haskell-text=1.2.0.4-1"
             "haskell-transformers-compat=0.3.3.4-2"
             "haskell-unix-compat=0.4.1.4-1"
             "haskell-unordered-containers=0.2.5.1-6"
             "haskell-wai=3.0.2.1-2"
             "haskell-wai-extra=3.0.4.1-1"
             "haskell-warp=3.0.5.1-1"
             "haskell-yaml=0.8.10.1-8"
             "haskell-zlib=0.5.4.2-2")
depends=()
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("5485ae70cf5af4f854a8452791848b88ad9a39f2c76207300e7237c39c32045d")

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    # no cabal patch
    # no source patch
}

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --prefix=/usr --docdir="/usr/share/doc/${pkgname}"
    runhaskell Setup build
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    runhaskell Setup copy --destdir="${pkgdir}"
}
