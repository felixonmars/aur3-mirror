# custom variables
_hkgname=yesod-auth
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-yesod-auth
pkgver=1.4.1.3
pkgrel=3
pkgdesc="Authentication for Yesod."
url="http://www.yesodweb.com/"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-aeson=0.8.0.2-9"
         "haskell-authenticate=1.3.2.11-5"
         "haskell-base16-bytestring=0.1.1.6-57"
         "haskell-base64-bytestring=1.0.0.1-57"
         "haskell-blaze-builder=0.3.3.4-4"
         "haskell-blaze-html=0.7.0.3-5"
         "haskell-blaze-markup=0.6.2.0-2"
         "haskell-byteable=0.1.1-57"
         "haskell-conduit=1.2.3.1-4"
         "haskell-conduit-extra=1.1.6.2-1"
         "haskell-cryptohash=0.11.6-3"
         "haskell-data-default=0.5.3-59"
         "haskell-email-validate=2.0.1-17"
         "haskell-file-embed=0.0.7.1-1"
         "haskell-http-client=0.4.6.2-1"
         "haskell-http-conduit=2.1.5-10"
         "haskell-http-types=0.8.5-11"
         "haskell-lifted-base=0.2.3.3-4"
         "haskell-mime-mail=0.4.6.2-5"
         "haskell-network-uri=2.6.0.1-5"
         "haskell-persistent=2.1.1.4-1"
         "haskell-persistent-template=2.1.0.1-5"
         "haskell-random=1.1-1"
         "haskell-resourcet=1.1.3.3-4"
         "haskell-safe=0.3.8-2"
         "haskell-shakespeare=2.0.2.2-1"
         "haskell-text=1.2.0.4-1"
         "haskell-unordered-containers=0.2.5.1-6"
         "haskell-wai=3.0.2.1-2"
         "haskell-yesod-core=1.4.7.2-2"
         "haskell-yesod-form=1.4.3.1-4"
         "haskell-yesod-persistent=1.4.0.2-4")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("9d35ce558518b0bb7dee098ad10217c0fb5db4aaa8e97bd6a4f79f70ca793534")

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    # no cabal patch
    # no source patch
}

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-library-profiling --enable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid \
            -fnetwork-uri
    runhaskell Setup build
    runhaskell Setup haddock --hoogle --html
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/${pkgname}/register.sh"
    install    -m744 unregister.sh "${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}"
}
